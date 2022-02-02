<template>
  <div class="layout">
    <div class="layout-box">
      <div class="layout-box-img"></div>
      <div class="layout-box-form">
        <span class="logo"><i class="fab fa-uncharted"></i> Open Finance</span>
        <slot></slot>
      </div>
    </div>
  </div>
</template>
<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'Layout',
  setup() {
    
  },
})
</script>
