<template>
  <div>
    <h2>Create a Post</h2>
    <form @submit.prevent="createPost" class="flex flex-col gap-4">
      <label for="videoUrl">Video Url:</label>
      <input type="text" id="videoUrl" v-model="postData.video_url" class="cursor">

      <button type="submit">Create Post</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      postData: {
        video_url: ''
      },
      baseUrl : 'http://localhost:3000'
    };
  },
  methods: {
    async createPost() {
      try {
        const response = await axios.post(`${this.baseUrl}/posts`, this.postData); // Replace with your API endpoint
        // Optionally, you can handle the response, e.g., show a success message or navigate to the Dashboard
        console.log('Post created:', response.data);
      } catch (error) {
        console.error('Error creating post:', error);
      }
    }
  }
};
</script>
