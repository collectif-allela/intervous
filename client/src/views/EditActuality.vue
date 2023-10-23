<template>
  <div>
    <h2>Edit Actuality</h2>
    <form @submit.prevent="updateActuality" class="flex flex-col gap-4">
      <label for="title">Title:</label>
      <input type="text" id="title" v-model="actualityData.title" class="text-black">
      <label for="summary">Summary:</label>
      <input type="text" id="summary" v-model="actualityData.summary" class="text-black">
      <label for="body">Body:</label>
      <input type="text" id="body" v-model="actualityData.body" class="text-black">
      <label for="videoUrl">Video Url:</label>
      <input type="text" id="videoUrl" v-model="actualityData.video_url" class="text-black">
      <label for="tag">Tag:</label>
      <input type="text" id="tag" v-model="actualityData.tag" class="text-black">
      <button type="submit">Update Actuality</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  props: {
    id: String,
  },
  data() {
    return {
      actualityData: {
        title: '',
        summary: '',
        body: '',
        video_url: '',
        tag: '',
        post_id: null,
      },
      baseUrl: 'http://localhost:3000',
    };
  },
  computed: {
    // Convert the id prop to an integer
    postIdAsInteger() {
      return parseInt(this.id);
    },
  },
  created() {
    // Fetch the actuality data to edit when the component is created
    this.fetchActualityData();
  },
  methods: {
    async fetchActualityData() {
      try {
        // Replace this with an API call to fetch the actuality data to be edited
        const actualityId = this.$route.params.id; // Assuming you're using Vue Router
        const response = await axios.get(`${this.baseUrl}/actualities/${actualityId}`);
        this.actualityData = response.data; // Update actualityData with the fetched actuality data
      } catch (error) {
        console.error('Error fetching actuality data:', error);
      }
    },
    async updateActuality() {
      try {
        const actualityId = this.$route.params.id; // Assuming you're using Vue Router
        const response = await axios.put(`${this.baseUrl}/actualities/${actualityId}`, this.actualityData);
        // Optionally, you can handle the response, e.g., show a success message or navigate back to the Dashboard
        console.log('Actuality updated:', response.data);
        this.$router.push({ name: 'dashboard' });
      } catch (error) {
        console.error('Error updating actuality:', error);
      }
    },
  },
};
</script>
