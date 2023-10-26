<template class="App w-full">
  <div id="nav" class=" w-full bg-beige sticky bottom-0 flex justify-evenly p-4 ">
    <router-link
      to="/account"
      class="text-black font-semibold hover:text-blue-400 px-2 py-1 mx-2"
    >
      Account
    </router-link>
    <router-link
      to="/"
      class="text-black font-semibold hover:text-blue-400 px-2 py-1 mx-2"
    >
      Home
    </router-link>
    <router-link
      to="/search"
      class="text-black font-semibold hover:text-blue-400 px-2 py-1 mx-2"
    >
      Search
    </router-link>
  </div>
  <router-view class="p-4 bg-beige" />
</template>

<script setup>
const props = defineProps({});
</script>

<style scoped>
/* You can add your custom styles here */
</style>
