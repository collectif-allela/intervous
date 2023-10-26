<script setup>
</script>
<template>
<div class="w-full flex justify-center mt-6">
  <logo/>
</div>
<section class="mx-auto relative max-w-[390px]">
  <div class="h-full w-full bg-beige">
    <div class="grid w-full grid-cols-3 gap-[1px] px-4 py-10">
      <div v-for="(post, index) in posts" :key="post.id" class="relative">
        <h2 :class="postClass(index)" class="absolute z-10 uppercase italic leading-none text-beige">
          <span class="break-words bg-blue px-1">L'actu</span><br />
          <span class="ml-[3px] bg-blue px-1">du {{ post.date }}</span>
        </h2>
        <img class="object-cover z-0 h-[180px] w-[120px] min-h[180px]" :src="post.cover_img_url" alt="" />
      </div>
    </div>
  </div>
</section>
</template>

<script>

import logo from '../assets/logo.vue';

export default {
  components: { logo },
  data() {
    return {
      posts: [],
      loading: true,
      classes: ['top-2 left-2 ', 'bottom-2 left-2', 'top-2 left-2']
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
  },

  computed: {
    postClass() {
      return (index) => {
        // Calculate the class to apply based on the index
        const classIndex = index % this.classes.length;
      return this.classes[classIndex];
      };
    },
  }
};
</script>

