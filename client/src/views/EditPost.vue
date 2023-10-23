<template>
  <div>
    <input v-model="editedPost.title" />
    <textarea v-model="editedPost.content"></textarea>
    <button @click="savePost">Save</button>
  </div>
</template>

<script setup>
import { ref } from 'vue';

const editedPost = ref({ ...props.post });

const savePost = () => {
  // Implement save logic and update the post
};
const { props } = defineProps(['post']);
</script>
