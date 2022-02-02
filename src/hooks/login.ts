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

  const getIcon = (type: string) => {
    if (type === 'info') {
      return '<i class="fas fa-info-circle"></i>'
    }
    if (type === 'error') {
      return '<i class="fas fa-times-circle"></i>'
    }
    if (type === 'warning') {
      return '<i class="fas fa-exclamation-triangle"></i>'
    }
    if (type === 'success') {
      return '<i class="fas fa-check-circle"></i>'
    }
    if (type === 'github') {
      return '<i class="fab fa-github"></i>'
    }
    return '<i></i>'
  }

  return {
    urls: computed(() => env.urls as EnvUrl),
    titles: computed(() => env.titles as EnvTitle),
    permissions: computed(() => env.permissions as EnvPermission),
    labels: computed(() => env.labels as EnvLabel),
    forms: computed(() => env.forms as EnvForm),
    validations: computed(() => env.validations as EnvValidation),
    message: computed(() => env.message as EnvMessage),
    social: computed(() => env.social as EnvSocial[]),
    getUrl,
    getUsernameLabel,
    getIcon
  }
}
