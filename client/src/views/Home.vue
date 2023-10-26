<template>
  <div class="h-full w-full justify-center flex flex-col gap-y-4 pb-20">
    <div class="w-full flex items-center justify-center mb-3 mt-10">
      <Logo/>
    </div>
    <input type="date" v-model="selectedDate" @change="fetchData"
    class="text-black w-full text-center p-1 bg-beige border border-solid border-black"/>
    <div v-if="post" class="justify-center flex flex-col gap-4">
      <MainVideo :date = "post.video_date"></MainVideo>
      <!-- Actualities Tabs -->
      <div v-if="actualities && actualities.length > 0">
          <actualities-tab
          :actualities="actualities"
          :activeTab="activeTab"
          :post="post"
          :canModify="isAdmin"
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
import Logo from '../assets/logo.vue';
export default {
  components: {
    MainVideo,
    ActualitiesTab,
    Logo

},
  data() {
    return {
      loading: true,
      isAdmin: false,
      post: {
        created_at: '', // Define default values for properties you access
        video_url: '',
        video_date:'',
        postId: null,
      },
      actualities: [],
      selectedDate: new Date().toISOString().substr(0, 10),
      activeTab: 0, // Initialize with today's date
    };
  },
  methods: {
    async fetchPosts() {
      try {
        // const formattedDate = new Date(this.selectedDate).toISOString();
        const response = await this.$axios.get('/api/app/posts', {
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
        this.actualities = response.data;
        console.log(this.actualities.length)
      } catch (error) {
        console.error('Error fetching actualities:', error);
      }
    },
    async transformDate(date) {
      const day = date.substring(8, 10);
      const month = date.substring(5, 7);
      // Return the formatted date
      this.post.video_date = `${day}/${month}`;
      console.log("Video date passed: " + this.post.video_date)
    },
    async fetchData() {
      console.log("Fetching Data...");
      try {
        console.log("Fetching Post...");
        await this.fetchPosts();
        console.log("Fetching Actualities...");

        await this.fetchActualities();
        console.log("Setting Date...");
        await this.transformDate(this.selectedDate);
        // this.loading = false;
        console.log("Actualities after fetchData: " + this.actualities);
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    },

  },
  mounted() {
    this.fetchData();
  }
  // computed: {
  //   userHasPermissionToDelete() {
  //     // Implement your permission logic here
  //     // For example, check the user's role or other criteria
  //     return this.user.role === 'admin'; // Adjust this condition as needed
  //   },
  // },
};
</script>
