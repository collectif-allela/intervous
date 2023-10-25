<template>
  <div>
    <h2>Edit Post</h2>
    <form @submit.prevent="updatePost" class="flex flex-col gap-4">
      <label for="videoUrl">Video Url:</label>
      <input type="text" id="videoUrl" v-model="postData.video_url" class="cursor text-black">
      <button type="submit" class="px-4 w-fit py-2 bg-blue text-white rounded-md hover:bg-green-600">
        Update Post
      </button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      postData: {
        video_url: '',
      },
    };
  },
  created() {
    // Fetch the post data to edit when the component is created
    this.fetchPostData();
  },
  methods: {
    async fetchPostData() {
      try {
        // Replace this with an API call to fetch the post data to be edited
        const postId = this.$route.params.id; // Assuming you're using Vue Router
        const response = await axios.get(`/api/app/posts/${postId}`);
        this.postData = response.data; // Update postData with the fetched post data
      } catch (error) {
        console.error('Error fetching post data:', error);
      }
    },
    async updatePost() {
      try {
        const postId = this.$route.params.id; // Assuming you're using Vue Router
        const response = await axios.put(`/api/app/posts/${postId}`, this.postData);
        // Optionally, you can handle the response, e.g., show a success message or navigate back to the Dashboard
        console.log('Post updated:', response.data);
        this.$router.push({ name: 'Dashboard' });
      } catch (error) {
        console.error('Error updating post:', error);
      }
    },
  },
};
</script>
