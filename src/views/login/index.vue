<template>
  <layout>
    <h3 class="title">{{ titles.loginAccountTitle }}</h3>
    <div v-if="message.sumary" :class="`alert-${message.type}`">
      <span v-html="getIcon(env.message.type)"></span>
      <span>{{ message.sumary }}</span>
    </div>
    <form :action="getUrl(urls.loginAction)" method="post">
      <div :class="validations.usernameOrPassword ? 'form-group error' : 'form-group'">
        <label for="username">{{ getUsernameLabel() }}</label>
        <input tabindex="1" name="username" :value="forms.loginUsername" type="text" />
        <span>{{ validations.usernameOrPassword }}</span>
      </div>
      <div :class="validations.usernameOrPassword ? 'form-group error' : 'form-group'">
        <label for="password">{{ labels.password }}</label>
        <input tabindex="2" name="password" type="password" autocomplete="off" />
      </div>
      
      <div v-if="permissions.rememberMe && !permissions.usernameEditDisabled" class="checkbox">
        <label>
          <input tabindex="3" name="rememberMe" type="checkbox" :checked="forms.loginRememberMe">
          {{ labels.rememberMe }}
        </label>
        <span v-if="permissions.resetPasswordAllowed">
          <a tabindex="4" :href="getUrl(urls.loginResetCredentials)" class="forgot-password">{{ labels.doForgotPassword }}</a>
        </span>
      </div>
      <input type="hidden" name="credentialId" :value="forms.selectedCredential" />
      <button tabindex="5" type="submit">{{ labels.doLogIn }}</button>
    </form>
    <div class="register" v-if="permissions.password && permissions.registrationAllowed && !permissions.registrationDisabled">
      <span>{{ labels.noAccount }}</span>
      <a :href="getUrl(urls.registration)">{{ labels.doRegister }}</a>
    </div>
    <div v-if="social.length" class="social">
      <a v-for="item in social" :key="item.alias" :href="getUrl(item.loginUrl)">
        <span v-html="getIcon(item.alias)"></span>
        <span>{{ item.displayName }}</span>
      </a>
    </div>
  </layout>
</template>
<script lang="ts">
import { defineComponent } from 'vue'
import Layout from '~/components/Layout.vue'
import { useLogin } from '~/hooks'

export default defineComponent({
  name: 'Login',
  components: {
    Layout
  },
  setup() {
    return useLogin()
  },
  mounted() {
    console.log('Login')
  }
})
</script>

