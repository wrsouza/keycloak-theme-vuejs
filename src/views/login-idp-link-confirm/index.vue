<template>
  <layout>
    <h3 class="title">{{ titles.confirmLinkIdpTitle }}</h3>
    <div v-if="message.sumary" :class="`alert-${message.type}`">
      <span v-html="getIcon(message.type)"></span>
      <span>{{ getSumary(message.sumary) }}</span>
    </div>
    <form :action="getUrl(urls.loginAction)" method="post">
      <button
        tabindex="1"
        type="submit"
        name="submitAction"
        value="linkAccount"
      >
        {{ labels.confirmLinkIdpContinue }}
      </button>
      <div class="login">
        <a :href="getUrl(urls.login)">{{ labels.backToLogin }}</a>
      </div>
    </form>
  </layout>
</template>
<script lang="ts">
import { defineComponent } from 'vue'
import Layout from '~/components/Layout.vue'
import { useLogin } from '~/hooks'

export default defineComponent({
  name: 'LoginIdpLinkConfirm',
  components: {
    Layout
  },
  setup() {
    return useLogin()
  },
  mounted() {
    console.log('LoginIdpLinkConfirm')
  }
})
</script>
