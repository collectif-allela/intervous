<template>
  <div class="">

    <h1 class="text-2xl font-semibold mb-4">Dashboard</h1>
    <router-link to='/post/create'>
        <button class="px-4 py-2 bg-blue text-white rounded-md hover:bg-green-600">
          Create new Post
        </button>
      </router-link>
    <h2>All posts</h2>
    <div v-if="loading" class="text-gray-600">Loading...</div>
    <ul v-else class="flex items-center gap-4 border border-solid border-red w-full">
      <li v-for="post in posts" :key="post.id" class=" flex mb-4 p-4 bg-white w-fit shadow-md rounded-md">
        <div class="flex flex-col gap-4 items-center justify-between">
          <h2 class="text-lg font-semibold text-black">Video URL: {{ post.video_url }}</h2>
          <div class="space-x-4">
            <router-link :to="{ name: 'Post', params: { id: post.id } }">
              <button class="px-4 py-2 bg-blue text-white rounded-md hover:bg-blue">
                See
              </button>
            </router-link>
            <router-link :to="{ name: 'EditPost', params: { id: post.id } }">
              <button class="pointer px-4 py-2 bg-yellow-500 text-white rounded-md hover-bg-yellow-600">
                Edit
              </button>
            </router-link>
            <button @click="deletePost(post.id)" class="px-4 py-2 bg-red-500 text-white rounded-md hover:bg-red-600">
              Delete
            </button>
          </div>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      posts: [],
      loading: true
    };
  },
  mounted() {
    this.fetchPosts();
  },
  methods: {
    async fetchPosts() {
      try {
        const response = await this.$axios.get('/api/app/posts'); // Replace with your API endpoint
        this.posts = response.data;
        this.loading = false;
      } catch (error) {
        console.error('Error fetching posts:', error);
      }
    },
    async deletePost(postId) {
      try {
        // Use Axios to delete the post
        await this.$axios.delete(`/posts/${postId}`);

        // Update the posts array to remove the deleted post
        this.posts = this.posts.filter(post => post.id !== postId);
      } catch (error) {
        console.error('Error deleting post:', error);
      }
    }
  }
};
</script>
