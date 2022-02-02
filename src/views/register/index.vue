<template>
  <layout>
    <h3 class="title">{{ titles.registerTitle }}</h3>
    <div v-if="message.sumary" :class="`alert-${message.type}`">
      <span v-html="getIcon(env.message.type)"></span>
      <span>{{ message.sumary }}</span>
    </div>
    <form :action="getUrl(urls.registrationAction)" method="post">
      <div class="row">
        <div :class="validations.firstName ? 'form-group error' : 'form-group'">
          <label for="password">{{ labels.firstName }}</label>
          <input tabindex="1" name="firstName" type="text" :value="forms.registerFirstName" autocomplete="off" />
          <span>{{ validations.firstName }}</span>
        </div>
        <div :class="validations.lastName ? 'form-group error' : 'form-group'">
          <label for="password">{{ labels.lastName }}</label>
          <input tabindex="2" name="lastName" type="text" :value="forms.registerLastName" autocomplete="off" />
          <span>{{ validations.lastName }}</span>
        </div>
      </div>
      <div class="row">
        <div :class="validations.email ? 'form-group error' : 'form-group'">
          <label for="password">{{ labels.email }}</label>
          <input tabindex="3" name="email" type="text" :value="forms.registerEmail" autocomplete="off" />
          <span>{{ validations.email }}</span>
        </div>
        <div v-if="!permissions.registrationEmailAsUsername" :class="validations.username ? 'form-group error' : 'form-group'">
          <label for="password">{{ labels.username }}</label>
          <input tabindex="4" name="username" type="text" :value="forms.registerUsername" autocomplete="off" />
          <span>{{ validations.username }}</span>
        </div>
      </div>
      <div class="row">
        <div :class="validations.password ? 'form-group error' : 'form-group'">
          <label for="password">{{ labels.password }}</label>
          <input tabindex="5" name="password" type="password" autocomplete="off" />
          <span>{{ validations.password }}</span>
        </div>
        <div :class="validations.passwordConfirm ? 'form-group error' : 'form-group'">
          <label for="password">{{ labels.passwordConfirm }}</label>
          <input tabindex="6" name="password-confirm" type="password" autocomplete="off" />
          <span>{{ validations.passwordConfirm }}</span>
        </div>
      </div>
      <input type="hidden" name="credentialId" :value="forms.selectedCredential" />
      <button tabindex="7" type="submit">{{ labels.doRegister }}</button>
    </form>
    <div class="login">
      <a :href="getUrl(urls.login)">{{ labels.backToLogin }}</a>
    </div>
  </layout>
</template>
<script lang="ts">
import { defineComponent } from 'vue'
import Layout from '~/components/Layout.vue'
import { useLogin } from '~/hooks'

export default defineComponent({
  name: 'Register',
  components: {
    Layout
  },
  setup() {
    return useLogin()
  },
  mounted() {
    console.log('Register')
  }
})
</script>

