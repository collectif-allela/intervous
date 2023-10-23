<template>
    <div v-if="loading" class="text-gray-600">Loading...</div>
    <div v-else>
      <div class="p-4">
        <!-- Post Date -->
        <div class="mb-4 text-gray-600">
         Post created on:  {{ post.created_at }}
        </div>

        <!-- Video URL -->
        <div class="mb-4">
          <p>Video URl: {{ post.video_url }}</p>
          <!-- /<iframe :src="post.video_url" class="w-full h-64" frameborder="0" allowfullscreen></iframe> -->
        </div>
        <div class="flex gap-5 align-middle items-center my-10 m">
          <h2 class="font-bold">Actualities</h2>
          <router-link :to="{ name: 'CreateActuality',  params: { id: post.id } }">
              <button class="px-4 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600">
                Add Actuality
              </button>
            </router-link>
        </div>

        <!-- Actualities Tabs -->
        <div v-if="post.actualities && post.actualities.length > 0">

          <div class="flex border-b border-gray-300">
            <!-- Tab Buttons -->
            <div
              v-for="(actuality, index) in post.actualities"
              :key="index"
              @click="activeTab = index"
              :class="['px-4 py-2 cursor-pointer', activeTab === index ? 'border-b-2 border-blue-500' : 'text-gray-500']"
            >
              {{ index + 1}}
            </div>
          </div>

          <!-- Tab Content -->
          <div class="p-4">
            <div v-for="(actuality, index) in post.actualities" :key="index" v-show="activeTab === index">
              <h2 class="text-lg font-bold mb-2">{{ actuality.title }}</h2>
              <p class="text-gray-600">{{ actuality.summary }}</p>
              <p class="text-gray-600">{{ actuality.body }}</p>
              <p class="text-gray-600">{{ actuality.tag }}</p>

            </div>
          </div>
        </div>
        <div v-else>
          <p>There are no actualities yet</p>
        </div>
      </div>
    </div>
</template>

<script>
export default {
  props: {
    id: String,
  },
  data() {
    return {
      post: {
        created_at: '', // Define default values for properties you access
        video_url: '',
        actualities: [],
      },
      activeTab: 0,
      loading: true,
    };
  },
  created() {
    this.fetchPost();
    this.fetchActualities(this.id); // Use "this.id" to access the prop
  },
  methods: {
    async fetchPost() {
      try {
        const postId = this.id;
        const response = await this.$axios.get(`/posts/${postId}`);
        this.post = response.data;
        this.loading = false;
      } catch (error) {
        console.error('Error fetching post:', error);
      }
    },
    async fetchActualities(postId) {
      try {
        const response = await this.$axios.get('/actualities', {
          params: {
            postId: postId,
          },
        });
        this.post.actualities = response.data; // Update post's actualities property
        if (this.post.actualities.length === 0){
          this.loading = false;
        };
      } catch (error) {
        console.error('Error fetching actualities:', error);
      }
    },
  },
};
</script>

<style scoped>
/* You can style your component using Tailwind CSS classes here. */
</style>
