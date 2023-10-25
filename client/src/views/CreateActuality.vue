<template>
  <div>
    <h2>Create new Actuality</h2>
    <form @submit.prevent="createActuality" class="flex flex-col gap-4">
      <label for="title">Title:</label>
      <input type="text" id="title" v-model="actualityData.title" class="text-black">
      <label for="summary">Summary:</label>
      <input type="text" id="summary" v-model="actualityData.summary" class="text-black">
      <label for="body">Body:</label>
      <input type="text" id="body" v-model="actualityData.body" class="text-black">
      <label for="videoUrl">Video Url:</label>
      <input type="text" id="videoUrl" v-model="actualityData.video_url" class="text-black">
      <label for="tag">Tag:</label>
      <input type="text" id="tag" v-model="actualityData.tag" class="text-black">      <button type="submit">Create Actuality</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  props: {
    id: String
  },
  data() {
    return {
      actualityData: {
        title: '',
        summary : '',
        body: '',
        video_url: '',
        tag: '',
        post_id: null,
      },
    };
  },
  computed: {
  // Convert the id prop to an integer
  postIdAsInteger() {
    return parseInt(this.id);
  },
},
created() {
  // Assign the converted integer to the actualityData
  this.actualityData.post_id = this.postIdAsInteger;
},
  methods: {
    async createActuality() {
      try {
        const response = await axios.post(`api/app/actualities`, this.actualityData); // Replace with your API endpoint
        // console.log('Post created:', response.data);
        // // Optionally, you can handle the response, e.g., show a success message or navigate to the Dashboard
        // window.alert('Actuality created');
        // Redirect to the dashboard view
        this.$router.push({ name: 'Post', params: { id: this.id } });
      } catch (error) {
        console.error('Error creating actuality:', error);
      }
    }
  }
};
</script>
