<template class="App w-full bg-black">
  <div id="nav" class=" w-full fixed bottom-0 flex justify-center p-4 bg-gray-800">
    <router-link
      to="/"
      class="text-white font-semibold hover:text-blue-400 px-2 py-1 mx-2"
    >
      Home
    </router-link>
    <router-link
      to="/account"
      class="text-white font-semibold hover:text-blue-400 px-2 py-1 mx-2"
    >
      Account
    </router-link>
    <router-link
      to="/dashboard"
      class="text-white font-semibold hover:text-blue-400 px-2 py-1 mx-2"
    >
      Dashboard
    </router-link>
  </div>
  <router-view class="p-4" />
</template>

<script setup>
const props = defineProps({});
</script>

<style scoped>
/* You can add your custom styles here */
</style>
