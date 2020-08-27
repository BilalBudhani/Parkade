<template>
  <div>
    <Header />
    <main class="container mx-auto">
      <slot></slot>
    </main>
  </div>
</template>

<script>
import Header from "./Header";
export default {
  components: {
    Header
  },
  computed: {
    flashMessage() {
      const { success, alert } = this.$page.flash;
      return success || alert;
    }
  },
  watch: {
    flashMessage() {
      this.showFlashMessages();
    }
  },
  methods: {
    showFlashMessages() {
      if (this.flashMessage) {
        this.$toast.open({
          message: this.flashMessage,
          type: this.$page.flash.success ? 'success' : 'error'
        });
      }
    }
  },
  mounted() {
    this.showFlashMessages();
  }
}
</script>