<template>
  <div class="h-full w-full justify-center flex flex-col gap-4">
    <input type="date" v-model="selectedDate" @change="fetchData"
    class="text-black w-full text-center p-1 bg-beige border border-solid border-black"/>
    <div v-if="post" class="justify-center flex flex-col gap-4">
      <h1 class="text-center ">Today's Post</h1>
      <MainVideo></MainVideo>
      <p>{{ post.video_url }}</p>
      <!-- Actualities Tabs -->
      <div v-if="post.actualities && post.actualities.length > 0">
        <actualities-tab
          :actualities="post.actualities"
          :activeTab="activeTab"
          :post="post"
          :canDelete="userHasPermissionToDelete"
          @tab-click="activeTab = $event"
          @delete-actuality="deleteActuality($event)"
        ></actualities-tab>
      </div>
      <div v-else>
      <h2>There are no post actualities or there is a problem.</h2>
    </div>

    </div>
    <div v-else>
      <h2>There are no posts for this date, choose another one</h2>
    </div>
  </div>
</template>

<script>
import MainVideo from '../components/ui/MainVideo.vue';
import ActualitiesTab from '../components/templates/ActualitiesTab.vue'
export default {
  components: {
    MainVideo, // Register the video component
    ActualitiesTab,
  },
  data() {
    return {
      userHasPermissionToDelete: false,
      post: {
        created_at: '', // Define default values for properties you access
        video_url: '',
        postId: null,
        actualities: [],

      },
      selectedDate: new Date().toISOString().substr(0, 10), // Initialize with today's date
    };
  },
  methods: {
    async fetchPosts() {
      try {
        // const formattedDate = new Date(this.selectedDate).toISOString();
        console.log("Selected Date: " + this.selectedDate);
        const response = await this.$axios.get(`/api/app/posts`, {
          params: { created_at: this.selectedDate },
        });
        this.post = response.data[0];
        this.post.postId = response.data[0].id;
        console.log("Post: " + this.post.postId);
      } catch (error) {
        console.error('Error fetching posts', error);
      }
    },
    async fetchActualities() {
      try {
        const postId = this.post.postId;
        const response = await this.$axios.get(`/api/app/actualities?post_id=${postId}`);
        console.log(response);
        console.log('Response on fetchActualities: ' + response.data);
        console.log('Type of response: ' + typeof(response.data));
        this.post.actualities = response.data;
        if (this.post.actualities.length === 0) {
          this.loading = false;
        }
      } catch (error) {
        console.error('Error fetching actualities:', error);
      }
    },
    async fetchData() {
    console.log("Fetching Data...");
    await this.fetchPosts(); // Wait for fetchPosts to complete before proceeding
    this.fetchActualities();
    },
  },
  mounted() {
    this.fetchData();
  },
  // computed: {
  //   userHasPermissionToDelete() {
  //     // Implement your permission logic here
  //     // For example, check the user's role or other criteria
  //     return this.user.role === 'admin'; // Adjust this condition as needed
  //   },
  // },
};
</script>
