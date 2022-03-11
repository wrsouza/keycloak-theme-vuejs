# Keycloak Theme with Vue 3 and Typescript

- You need to have docker installed on your development environment
- Follow the instructions bellow to run this theme
- https://youtu.be/qrjjiG1206E ( tutorial pt-br )


### 1. Run database for Keycloak (Postgres)
Attention: Configure Volume folder in your environment and replace this (~/database/postgres)

```
docker run -d --name postgres \
    -p 5432:5432 \
    -e POSTGRES_DB=keycloak \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=postgres \
    -v ~/database/postgres:/var/lib/postgresql/data \
    --restart always postgres:latest

```


### 2. Run Keycloak with correct configuration database

```
docker run -d --name keycloak \
    -p 8080:8080 \
    -e DB_VENDOR=postgres \
    -e DB_ADDR=postgres \
    -e DB_DATABASE=keycloak \
    -e DB_SCHEMA=public \
    -e DB_USER=postgres \
    -e DB_PASSWORD=postgres \
    -e KEYCLOAK_USER=admin \
    -e KEYCLOAK_PASSWORD=admin \
    --link postgres \
    --restart always quay.io/keycloak/keycloak:16.1.0
```



### 3. Create a folder "keycloak" in your environment and copy themes folder from docker container

```
mkdir keycloak
cd keycloak
docker cp keycloak:/opt/jboss/keycloak/themes .
```


### 4. Clone this repository inside keycloak folder

```
git clone https://github.com/wrsouza/keycloak-theme-vuejs
```


### 5. Create a file "disable-theme-cache.cli" inside keycloak folder and insert script bellow.

```
embed-server --std-out=echo --server-config=standalone-ha.xml
/subsystem=keycloak-server/theme=defaults/:write-attribute(name=cacheThemes,value=false)
/subsystem=keycloak-server/theme=defaults/:write-attribute(name=cacheTemplates,value=false)
/subsystem=keycloak-server/theme=defaults/:write-attribute(name=staticMaxAge,value=-1)
stop-embedded-server

```


### 6. Remove keycloak container
```
docker rm -f keycloak
```


### 7. Run keycloak container with volumes for disable cache and share themes folder

```
docker run -d --name keycloak \
    -p 8080:8080 \
    -e DB_VENDOR=postgres \
    -e DB_ADDR=postgres \
    -e DB_DATABASE=keycloak \
    -e DB_SCHEMA=public \
    -e DB_USER=postgres \
    -e DB_PASSWORD=postgres \
    -e KEYCLOAK_USER=admin \
    -e KEYCLOAK_PASSWORD=admin \
    --link postgres \
    -v ~/keycloak/themes:/opt/jboss/keycloak/themes \
    -v ~/keycloak/disable-theme-cache.cli:/opt/jboss/startup-scripts/disable-theme-cache.cli \
    --restart always quay.io/keycloak/keycloak:16.1.0
```

### 8. Open keycloak-theme-vuejs repository folder and install with yarn
```
cd keycloak-theme-vuejs
yarn
```

### 9. Configure theme name inside webpack.config.js (THEME_NAME) and run the command bellow
```
yarn build
```

### 10. Open browser with Keycloak URL and click on Administration Console for login
```
keycloakUrl: http://localhost:8080
username: admin
password: admin
```

### 11. Create your realm and select keycloak theme in realm settings.

