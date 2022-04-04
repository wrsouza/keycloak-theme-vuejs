<template>
  <layout>
    <h3 class="title">{{ titles.emailLinkIdpTitle }}</h3>
    <div v-if="message.sumary" :class="`alert-${message.type}`">
      <span v-html="getIcon(message.type)"></span>
      <span>{{ getSumary(message.sumary) }}</span>
    </div>
    <p class="instruction">
      {{ instruction.emailLinkIdp1 }}
    </p>
    <p class="instruction">
      {{ instruction.emailLinkIdp2 }}
      <a :href="getUrl(urls.loginAction)">{{ labels.doClickHere }}</a>
      {{ instruction.emailLinkIdp3 }}
    </p>
    <p class="instruction">
      {{ instruction.emailLinkIdp4 }}
      <a :href="getUrl(urls.loginAction)">{{ labels.doClickHere }}</a>
      {{ instruction.emailLinkIdp5 }}
    </p>
  </layout>
</template>
<script lang="ts">
import { defineComponent } from 'vue'
import Layout from '~/components/Layout.vue'
import { useLogin } from '~/hooks'

export default defineComponent({
  name: 'LoginIdpLinkEmail',
  components: {
    Layout
  },
  setup() {
    return useLogin()
  },
  mounted() {
    console.log('LoginIdpLinkEmail')
  }
})
</script>
