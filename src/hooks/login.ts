import { inject, computed } from 'vue'

export const useLogin = () => {
  const env = inject('environment') as Environment

  const getUrl = (url: string) => {
    return url.replace(/(&amp;)/g, '&')
  }
  const getUsernameLabel = () => {
    if (!env.permissions.loginWithEmailAllowed) {
      return env.labels.username
    }
    if (!env.permissions.registrationEmailAsUsername) {
      return env.labels.usernameOrEmail
    }
    return env.labels.email
  }

  const getIcon = () => {
    if (env.message.type === 'info') {
      return '<i class="fas fa-info-circle"></i>'
    }
    if (env.message.type === 'error') {
      return '<i class="fas fa-times-circle"></i>'
    }
    if (env.message.type === 'warning') {
      return '<i class="fas fa-exclamation-triangle"></i>'
    }
    if (env.message.type === 'success') {
      return '<i class="fas fa-check-circle"></i>'
    }
  }

  return {
    urls: computed(() => env.urls),
    titles: computed(() => env.titles),
    permissions: computed(() => env.permissions),
    labels: computed(() => env.labels),
    forms: computed(() => env.forms),
    validations: computed(() => env.validations),
    message: computed(() => env.message),
    getUrl,
    getUsernameLabel,
    getIcon
  }
}
