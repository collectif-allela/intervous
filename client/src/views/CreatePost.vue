<template>
  <div>
    <h2>Create a Post</h2>
    <form @submit.prevent="createPost" class="flex flex-col gap-2">
      <label for="videoUrl">Video Url:</label>
      <input type="text" id="videoUrl" v-model="postData.video_url" class="cursor text-black" >
      <label for="videoUrl">Cover image URL</label>
      <input type="text" id="cover_img_url" v-model="postData.cover_img_url" class="cursor text-black" >
      <label for="videoUrl">Posted Date</label>
      <input type="date" id="published_at" v-model="postData.published_at" class="cursor text-black mb-3" >
      <button type="submit" class="px-4 w-fit py-2 bg-blue text-white rounded-md hover:bg-green-600">
          Create new Post
        </button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      inputValue: '',
      postData: {
        video_url: '',
        cover_img_url: '',
        published_at: '',
      },
    };
  },
  methods: {
    async createPost() {
      try {
        const response = await axios.post(`/api/app/posts`, this.postData); // Replace with your API endpoint
        // Optionally, you can handle the response, e.g., show a success message or navigate to the Dashboard
        // console.log('Post created:', response.data);
        this.$router.push({ name: 'Dashboard' });

      } catch (error) {
        console.error('Error creating post:', error);
      }
    }
  }
};
</script>
