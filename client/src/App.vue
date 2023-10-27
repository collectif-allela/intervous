<template class="App max-w-2xl">
<Navbar/>
  <router-view class="px-4 bg-beige" />
</template>

<script setup>
import Navbar from '/src/components/templates/Nav.vue';
const props = defineProps({});
</script>

<style scoped>
/* You can add your custom styles here */
</style>
