<template>
  <div id="app">
    <input type="date" v-model="selectedDate" @change="fetchPosts" />
    <div v-if="posts && posts.length > 0 ">
      <h1>Today's Post</h1>
      <MainVideo></MainVideo>
      <p>{{ posts[0].video_url }}</p>
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
      posts: [],
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
        this.posts = response.data;
        console.log(this.posts);
      } catch (error) {
        console.error('Error fetching posts', error);
      }
    },
  },
  mounted() {
    this.fetchPosts();
  },
};
</script>
