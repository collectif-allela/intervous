<template>
  <div>
    <div class="flex border-b border-gray-300">
      <!-- Tab Buttons -->
      <div
        v-for="(actuality, index) in actualities"
        :key="index"
        @click="$emit('tab-click', index)"
        :class="['px-4 py-2 cursor-pointer', activeTab === index ? 'border-b-2 border-blue-500' : 'text-gray-500']"
      >
        {{ index + 1 }}
      </div>
    </div>

    <!-- Tab Content -->
    <div class="tab-content p-4">
      <div v-for="(actuality, index) in actualities" :key="index" v-show="activeTab === index">
        <p class="text-gray-600">{{ actuality.id }}</p>
        <h2 class="text-lg font-bold mb-2">{{ actuality.title }}</h2>
        <p class="text-gray-600">{{ actuality.summary }}</p>
        <p class="text-gray-600">{{ actuality.body }}</p>
        <p class="text-gray-600">{{ actuality.tag }}</p>
        <p class="text-gray-600">{{ actuality.post_id }}</p>
        <router-link :to="{ name: 'EditActuality', params: { post_id: post.id, id: actuality.id } }">
          <button class="pointer px-4 py-2 bg-yellow-500 text-white rounded-md hover-bg-yellow-600">
            Edit
          </button>
        </router-link>
        <button
          v-if="canDelete"
          @click="deleteActuality(actuality.id)"
          class="px-4 py-2 bg-red-500 text-white rounded-md hover:bg-red-600"
        >
        Delete
      </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    actualities: Array,
    activeTab: Number,
    post: Object,
    canDelete: {
      type: Boolean,
      default: false,
    },
  },
  methods: {
    deleteActuality(actualityId) {
      this.$emit('delete-actuality', actualityId);
    },
  },
};
</script>
