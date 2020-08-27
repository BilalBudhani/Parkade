<template>
  <header class="border-b bg-white py-4 px-4 lg:px-0 mb-4 shadow">
      <div class="container mx-auto flex justify-between items-center">
          <h1>
            <inertia-link href="/" class="font-black text-2xl lg:text-3xl flex items-center hover:no-underline text-gray-900">
                Parkade
            </inertia-link>
          </h1>

          <nav class="relative">
              <button class="w-12 h-12 rounded-full overflow-hidden border-2 focus:outline-none" @click="handleMenuToggle">
                  <img :src="$page.user.avatar_url" class="w-full h-full object-cover" :alt="$page.user.name" />

                  <strong>{{$page.user.name}}</strong>
              </button>

              <div class="absolute right-0 mt-2 py-2 w-32 bg-white rounded-md shadow-lg z-50 border-2 text-sm" v-show="menuOpen">
                  <a href="https://headwayapp.co/markr-changelog" target="_blank" class="block px-4 py-2 text-gray-800 hover:underline">Changelog</a>
                  <a href="mailto:bilal@markr.app?subject=Feedback" class="block px-4 py-2 text-gray-800 hover:underline">Feedback</a>
                  <a href="/logout" class="block px-4 py-2 text-gray-800 hover:underline">Logout</a>
              </div>
          </nav>
      </div>
    </header>
</template>
<script>
import isEmpty from "lodash/isEmpty";
export default {
  data() {
    return {
      search: null,
      menuOpen: false
    };
  },
  methods: {
    handleMenuToggle() {
      this.menuOpen = !this.menuOpen;
    },
    handleLogout() {
      if (confirm('Do you want to logout?')) {
          window.location.href = "/logout";
      }
    }
  }
}
</script>
