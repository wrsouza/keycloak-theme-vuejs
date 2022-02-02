<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <#nested "head">
</head>
<body>
  <div id="app"></div>
  <script id="environment" type="application/json">
    {
      "urls": {
        "loginResetCredentials": "${url.loginResetCredentialsUrl}",
        "login": "${url.loginUrl}",
        "registration": "${url.registrationUrl}",
        "loginAction": "${url.loginAction}",
        "registrationAction": "${url.registrationAction}"
      },
      "titles": {
        "loginAccountTitle": "${msg("loginAccountTitle")}",
        "registerTitle": "${msg("registerTitle")}",
        "emailForgotTitle": "${msg("emailForgotTitle")}"
      },
      "permissions": {
        "usernameEditDisabled": <#if usernameEditDisabled??>true<#else>false</#if>,
        "loginWithEmailAllowed": <#if realm.loginWithEmailAllowed>true<#else>false</#if>,
        "registrationEmailAsUsername": <#if realm.registrationEmailAsUsername>true<#else>false</#if>,
        "rememberMe": <#if realm.rememberMe>true<#else>false</#if>,
        "resetPasswordAllowed": <#if realm.resetPasswordAllowed>true<#else>false</#if>,
        "password": <#if realm.password>true<#else>false</#if>,
        "registrationAllowed": <#if realm.registrationAllowed>true<#else>false</#if>,
        "registrationDisabled": <#if registrationDisabled??>true<#else>false</#if>,
        "passwordRequired": <#if passwordRequired??>true<#else>false</#if>
      },
      "labels": {
        "firstName": "${msg("firstName")}",
        "lastName": "${msg("lastName")}",
        "username": "${msg("username")}",
        "usernameOrEmail": "${msg("usernameOrEmail")}",
        "email": "${msg("email")}",
        "password": "${msg("password")}",
        "passwordConfirm": "${msg("passwordConfirm")}",
        "rememberMe": "${msg("rememberMe")}",
        "doForgotPassword": "${msg("doForgotPassword")}",
        "doLogIn": "${msg("doLogIn")}",
        "doSubmit": "${msg("doSubmit")}",
        "noAccount": "${msg("noAccount")}",
        "doRegister": "${msg("doRegister")}",
        "backToLogin": "${kcSanitize(msg("backToLogin"))?no_esc}"
      },
      "forms": {
        "loginUsername": "${(login.username!'')}",
        "loginRememberMe": <#if login.rememberMe??>true<#else>false</#if>,
        "selectedCredential": "${(auth.selectedCredential!'')}",
        "registerFirstName": <#if register??>"${(register.formData.firstName!'')}"<#else>""</#if>,
        "registerLastName": <#if register??>"${(register.formData.lastName!'')}"<#else>""</#if>,
        "registerEmail": <#if register??>"${(register.formData.email!'')}"<#else>""</#if>,
        "registerUsername": <#if register??>"${(register.formData.username!'')}"<#else>""</#if>
      },
      "validations": {
        "firstName": <#if messagesPerField.existsError('firstName')>"${kcSanitize(messagesPerField.get('firstName'))?no_esc}"<#else>""</#if>,
        "lastName":  <#if messagesPerField.existsError('lastName')>"${kcSanitize(messagesPerField.get('lastName'))?no_esc}"<#else>""</#if>,
        "email": <#if messagesPerField.existsError('email')>"${kcSanitize(messagesPerField.get('email'))?no_esc}"<#else>""</#if>,
        "usernameOrPassword": <#if messagesPerField.existsError('username','password')>"${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}"<#else>""</#if>,
        "username": <#if messagesPerField.existsError('username')>"${kcSanitize(messagesPerField.get('username'))?no_esc}"<#else>""</#if>,
        "password": <#if messagesPerField.existsError('password')>"${kcSanitize(messagesPerField.get('password'))?no_esc}"<#else>""</#if>,
        "passwordConfirm": <#if messagesPerField.existsError('password-confirm')>"${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}"<#else>""</#if>
      },
      "message": {
        "type": <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>"${message.type}"<#else>""</#if>,
        "sumary": <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>"${kcSanitize(message.summary)?no_esc}"<#else>""</#if>
      },
      "social": [
        <#if realm.password && social.providers??>
          <#list social.providers as p>
            { 
              "alias": "${p.alias}",
              "displayName": "${p.displayName!}",
              "loginUrl": "${p.loginUrl}"
            }<#sep>, </#sep>
          </#list>
        </#if>
      ]
    }
  </script>
  <#nested "scripts">
</body>
</html>
</#macro>
