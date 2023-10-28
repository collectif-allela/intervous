<template>
    <div v-if="loading" class="text-gray-600">Loading...</div>
    <div v-else>
      <div class="p-4">
        <!-- Post Date -->
        <div class="mb-4 text-black">
          <h2 class='text-2xl font-semibold my-4'>Post created on: </h2>
          <p> {{ post.created_at }}</p>
        </div>

        <!-- Video URL -->
        <div class="mb-4">
          <h2 class='text-2xl font-semibold my-4'>Video URl:</h2>

          <p> {{ post.video_url }}</p>
          <!-- /<iframe :src="post.video_url" class="w-full h-64" frameborder="0" allowfullscreen></iframe> -->
        </div>
        <div class="flex gap-5 align-middle items-center my-10 m">
          <h2 class="font-bold">Actualities</h2>
          <router-link :to="{ name: 'CreateActuality',  params: { id: post.id } }">
              <button class="px-4 py-2 bg-blue text-white rounded-md hover:bg-green-600">
                Add Actuality
              </button>
            </router-link>
        </div>

        <!-- Actualities Tabs -->
        <div v-if="post.actualities && post.actualities.length > 0">

          <div class="flex border-b  border-gray-300">
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
          <div class="p-4 mb-20">
            <div v-for="(actuality, index) in post.actualities" :key="index" v-show="activeTab === index">
              <h2 class="text-lg font-bold mb-2">{{ actuality.title }}</h2>
              <p class="text-gray-600">{{ actuality.body }}</p>
              <div class="flex gap-4  mt-6">
                <div class="basis-1/2">
                  <router-link :to="{ name: 'EditActuality', params: { post_id: post.id, id: actuality.id } }">
                  <button class="w-full pointer px-4 py-2 bg-yellow-500 text-white rounded-md hover-bg-yellow-600">
                    Edit
                  </button>
                </router-link>
                </div>
                <div class=" basis-1/2">
                  <button @click="deleteActuality(actuality.id)" class="px-4 py-2 w-full bg-red-500 text-white rounded-md hover:bg-red-600">
                    Delete
                  </button>
                </div>

              </div>

            </div>
          </div>
        </div>
        <div v-else>
          <p>Pas encore des actualités</p>
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
    this.fetchPost(this.id);
    this.fetchActualities(this.id); // Use "this.id" to access the prop post_id
  },
  methods: {
    async fetchPost(postId) {
      try {
        const response = await this.$axios.get(`/api/app/posts/${postId}`);
        this.post = response.data;
        this.loading = false;
      } catch (error) {
        console.error('Error fetching post:', error);
      }
    },
    async fetchActualities(postId) {
      try {
        const response = await this.$axios.get(`/api/app/actualities?post_id=${postId}`);
        this.post.actualities = response.data;
        if (this.post.actualities.length === 0) {
          this.loading = false;
        }
      } catch (error) {
        console.error('Error fetching actualities:', error);
      }
    },

    async deleteActuality(actualityId) {
      try {
        // Use Axios to delete the post
        await this.$axios.delete(`/api/app/actualities/${actualityId}`);
        // Update the posts array to remove the deleted post
        this.post.actualities = this.post.actualities.filter(actuality => actuality.id !== actualityId);
      } catch (error) {
        console.error('Error deleting post:', error);
      }
    }
  },
};
</script>

<style scoped>
/* You can style your component using Tailwind CSS classes here. */
</style>
