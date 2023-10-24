<template>
  <div class="h-full w-full justify-center flex flex-col gap-4">
    <input type="date" v-model="selectedDate" @change="fetchPosts"
    class="text-black w-full text-center p-1 bg-beige border border-solid border-black"/>
    <div v-if="post" class="justify-center flex flex-col gap-4">
      <h1 class="text-center ">Today's Post</h1>
      <MainVideo></MainVideo>
      <p>{{ post.video_url }}</p>
    </div>
    <div v-else>
      <h2>There are no posts for this date, choose another one</h2>
    </div>
  </div>
</template>

<script>
import MainVideo from '../components/ui/MainVideo.vue';
export default {
  components: {
    MainVideo, // Register the video component
  },
  data() {
    return {
      post: {
        created_at: '', // Define default values for properties you access
        video_url: '',
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
        const response = await this.$axios.get(`/posts`, {
          params: { created_at: this.selectedDate },
        });
        this.post = response.data[0];
        console.log(this.post);
      } catch (error) {
        console.error('Error fetching posts', error);
      }
    },
    async fetchActualities() {
      try {
        const postId = this.post.postId;
        const response = await this.$axios.get(`/actualities?post_id=${postId}`);
        this.posts.actualities = response.data;
        if (this.post.actualities.length === 0) {
          this.loading = false;
        }
      } catch (error) {
        console.error('Error fetching actualities:', error);
      }
    },
  },
  mounted() {
    this.fetchPosts();
  },
};
</script>
