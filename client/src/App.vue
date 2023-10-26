<template class="App w-full">
  <div id="nav" class="uppercase border-t-[1px] border-black text-[10px] text-black border-top w-full fixed z-50 bottom-0 flex justify-between p-3 bg-beige">
    <router-link
      to="/"
      class="hover:text-blue-400 px-2 py-1 flex flex-col justify-center items-center gap-y-1"
    >
    <homeSVG/>
      Accueil
    </router-link>
    <router-link
      to="/gallery"
      class="hover:text-blue-400 px-2 py-1 flex flex-col justify-center items-center gap-y-1"
    >
    <archiveSVG/>
      Archives
    </router-link>
    <router-link
      to="/notifications"
      class="hover:text-blue-400 px-2 py-1 flex flex-col justify-center items-center gap-y-1"
    >
    <notificationSVG/>
      Notifications
    </router-link>
    <router-link
      to="/account"
      class="hover:text-blue-400 px-2 py-1 flex flex-col justify-center items-center gap-y-1"
    >
    <profileSVG/>
      Profil
    </router-link>
  </div>
  <router-view class="p-4 bg-beige" />
</template>

<script setup>
import archiveSVG from '/src/assets/Archive.vue';
import homeSVG from '/src/assets/Home.vue';
import profileSVG from '/src/assets/Profile.vue';
import notificationSVG from '/src/assets/Notification.vue';
const props = defineProps({});
</script>

<style scoped>
/* You can add your custom styles here */
</style>
