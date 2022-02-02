<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
  <#if section = "scripts">
    <script typo="module" src="${url.resourcesPath}/js/register.js"></script>
  </#if>
</@layout.registrationLayout>
