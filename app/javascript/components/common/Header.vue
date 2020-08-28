<template>
  <header class="border-b bg-gray-800 text-white py-4 px-4 lg:px-0 mb-4 shadow">
    <div class="container mx-auto flex justify-between items-center">
      <inertia-link href="/" class="font-black text-2xl lg:text-3xl flex items-center hover:no-underline">
          Parkade
      </inertia-link>
      <nav class="flex items-center space-x-4">
        <a href="mailto:hey@bilal.dev">Feedback</a>
        <button class="w-12 h-12 rounded-full overflow-hidden border-2 focus:outline-none" @click="handleLogout">
          <img :src="$page.user.avatar_url" class="w-full h-full object-cover" :alt="$page.user.name" />
        </button>
      </nav>
    </div>
  </header>
</template>
<script>
export default {
  methods: {
    handleLogout() {
      if (confirm('Do you want to logout?')) {
          window.location.href = "/users/sign_out";
      }
    }
  }
}
</script>
