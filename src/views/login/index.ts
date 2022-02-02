import '~/scss/index.scss'
import { createApp } from 'vue'
import index from './index.vue'

const environment = document.querySelector('#environment')
if (environment) {
  const app = createApp(index)
  app.provide<Environment>('environment', JSON.parse(String(environment.textContent)))
  app.mount('#app')
}
