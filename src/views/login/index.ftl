<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
  <#if section = "scripts">
    <script typo="module" src="${url.resourcesPath}/js/login.js"></script>
  </#if>
</@layout.registrationLayout>
