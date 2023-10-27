<template>
<div id="nav" class="uppercase border-t-[1px] border-black text-[10px] text-black border-top w-full fixed z-50 bottom-0 flex justify-around p-3 bg-beige  mx-auto">
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
    <div v-if="authenticated">
      <!-- Show navigation links for authenticated users -->
      <router-link to="/dashboard">Dashboard</router-link>
      <router-link to="/profile">Profile</router-link>
      <button @click="logout">Logout</button>
    </div>
  </div>
</template>

<script >
import archiveSVG from '/src/assets/Archive.vue';
import homeSVG from '/src/assets/Home.vue';
import profileSVG from '/src/assets/Profile.vue';
import notificationSVG from '/src/assets/Notification.vue';
export default {
  computed: {
    authenticated() {
      // Check if the user is authenticated (e.g., based on the presence of an authentication token)
      return !!localStorage.getItem('authToken');
    },
  },
  methods: {
    logout() {
      // Implement the logout logic (clear the authentication token and user data)
      localStorage.removeItem('authToken');
      // You may want to perform additional logout actions, such as redirecting to the login page.
    },
  },
  components: {
    archiveSVG,
    homeSVG,
    profileSVG,
    notificationSVG, },
};
</script>
