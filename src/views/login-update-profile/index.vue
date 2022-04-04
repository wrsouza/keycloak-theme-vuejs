<template>
  <layout>
    <h3 class="title">{{ titles.loginProfileTitle }}</h3>
    <div v-if="message.sumary" :class="`alert-${message.type}`">
      <span v-html="getIcon(message.type)"></span>
      <span>{{ message.sumary }}</span>
    </div>
    <form :action="getUrl(urls.loginAction)" method="post">
      <div class="row">
        <div :class="validations.firstName ? 'form-group error' : 'form-group'">
          <label for="firstName">{{ labels.firstName }}</label>
          <input
            tabindex="1"
            name="firstName"
            type="text"
            :value="user.firstName"
            autocomplete="off"
          />
          <span>{{ validations.firstName }}</span>
        </div>
        <div :class="validations.lastName ? 'form-group error' : 'form-group'">
          <label for="lastName">{{ labels.lastName }}</label>
          <input
            tabindex="2"
            name="lastName"
            type="text"
            :value="user.lastName"
            autocomplete="off"
          />
          <span>{{ validations.lastName }}</span>
        </div>
      </div>
      <div class="row">
        <div :class="validations.email ? 'form-group error' : 'form-group'">
          <label for="email">{{ labels.email }}</label>
          <input
            tabindex="3"
            name="email"
            type="text"
            :value="user.email"
            autocomplete="off"
          />
          <span>{{ validations.email }}</span>
        </div>
        <div
          v-if="!permissions.registrationEmailAsUsername"
          :class="validations.username ? 'form-group error' : 'form-group'"
        >
          <label for="username">{{ labels.username }}</label>
          <input
            tabindex="4"
            name="username"
            type="text"
            :value="user.username"
            autocomplete="off"
          />
          <span>{{ validations.username }}</span>
        </div>
      </div>
      <button tabindex="5" type="submit">{{ labels.doSubmit }}</button>
    </form>
  </layout>
</template>
<script lang="ts">
import { defineComponent } from 'vue'
import Layout from '~/components/Layout.vue'
import { useLogin } from '~/hooks'

export default defineComponent({
  name: 'LoginUpdateProfile',
  components: {
    Layout
  },
  setup() {
    return useLogin()
  },
  mounted() {
    console.log('LoginUpdateProfile')
  }
})
</script>
