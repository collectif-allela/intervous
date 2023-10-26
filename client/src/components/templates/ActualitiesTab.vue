<template>
  <div class="actuality-box border-t  border-black ">
    <div class="flex justify-between border-r  border-black">
      <!-- Tab Buttons -->
      <div
        v-for="(actuality, index) in actualities"
        :key="index"
        @click="handleTabClick(index)"
        :class="['flex-1 items-center text-center px-4 py-2 cursor-pointer border-l  border-black', activeTab === index ? 'bg-blue text-white' : 'text-gray-500']"
      >
        {{ index + 1 }}.
      </div>
    </div>

    <!-- Tab Content -->
    <div class="tab-content border-x border-b border-black">
      <div class="" v-for="(actuality, index) in actualities" :key="index" v-show="activeTab === index">
        <h2 class="text-lg font-bold p-4 uppercase italic bg-blue text-white">{{ actuality.title }}</h2>
        <div class="p-4">
          <p class="text-gray-600">{{ actuality.summary }}</p>
          <p class="text-gray-600">{{ actuality.body }}</p>
          <p class="text-gray-600">{{ actuality.tag }}</p>
        </div>
        <!-- Add prop user to show correct image -->
        <!-- Pass correct actuality_id -->
        <router-link v-if="canModify" :to="{ name: 'EditActuality', params: { post_id: post.id, id: actuality.id } }">
          <button class="pointer px-4 py-2 bg-yellow-500 text-white rounded-md hover-bg-yellow-600">
            Edit
          </button>
        </router-link>
        <button
          v-if="canModify"
          @click="deleteActuality(actuality.id)"
          class="px-4 py-2 bg-red-500 text-white rounded-md hover:bg-red-600"
        >
        Delete
      </button>
      </div>
    </div>
    <CommentsSection  @reloadComments="pushComment" :actuality = "actualities[activeTab]" :activeTab="activeTab" :comments="comments"/>

  </div>
</template>

<script>
import CommentsSection from './CommentsSection.vue';

export default {
  data() {
    return {
      comments: [],
    };
  },
    props: {
        actualities: Array,
        activeTab: Number,
        post: Object,
        canModify: {
            type: Boolean,
            default: false,
        }

    },
    methods: {
      async deleteActuality(actualityId) {
          this.$emit('delete-actuality', actualityId);
      },
      async handleTabClick(index) {
      // Emit a custom event to trigger a component method
      await this.$emit('tab-click', index);
      console.log("Active Tab: " + (index +1))
      // You can also call a component method directly here
      this.fetchComments();
    },
      async fetchComments() {
        try {
          const index = this.activeTab;
          const actualityId = this.actualities[index].id;
          const response = await this.$axios.get(`/api/app/comments?actuality_id=${actualityId}`);
          this.comments = response.data;
          if (this.comments.length > 0) {
            console.log("Found comments");
            this.loading = false;
          } else {
            console.log("No comments found")
          }
        } catch (error) {
          console.error('Error fetching comments:', error);
        }
      },
      async pushComment(newComment) {
      // Update the comments prop here
      console.log("Recieved $event from Input grandchild, pushing comment into array");
      console.log("Comment Data: " + newComment);
      this.comments.push(newComment);
      },
    },

    mounted() {
      this.fetchComments(); // Use "this.id" to access the prop post_id
  },
    components: { CommentsSection }
};
</script>
