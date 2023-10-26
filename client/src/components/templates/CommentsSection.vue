<template>
  <div class="section-commentaires relative border-x border-b border-solid border-black ">
      <div class="sticky bg-blue text-white p-5 top-0 ">
          <h3 class="text-center uppercase italic">Commentaires</h3>
      </div>
      <div v-if ="comments && comments.length >0" class="flex flex-col items-center">
        <!-- Comments from actuality -->
        <div v-for="(comment, index) in comments.slice(0, commentsToShow)" class="w-full" >
          <!-- :userName="commen.user" -->
          <Comment profileImage= "https://media.discordapp.net/attachments/898466011391610890/1166737937027825694/nsey-benajah-5_gku5Usbzk-unsplash.jpg?" :timestamp= "comment.created_at" :commentText = comment.body :commentId = comment.id />
        </div>
        <button v-if="comments.length > commentsToShow" @click="loadMoreComments" class="mt-2 mx-auto text-center">Voir plus</button>

        <InputComment :actualityId = actuality.id @addComment="passComment"/>
      </div>
      <div v-else>
        <h3 class="text-center">Soyez le premiere a commenter !</h3>
        <InputComment :actualityId = actuality.id @addComment="passComment"/>
      </div>
    </div>
</template>
<script>
import InputComment from '../ui/InputComment.vue';
import Comment from '../ui/Comment.vue';
export default {
  data() {
  return {
    commentsToShow: 5, // Initial number of comments to display
    // other data properties
  };
},
  props: {
    actuality: Object, // Comment text
    activeTab: Number,
    comments: Array
  },
  methods: {
    passComment(newComment) {
      // Update the comments prop here
      console.error('Emmitting comment data to grandparent');
      this.$emit('reloadComments', newComment);
    },
    loadMoreComments() {
    this.commentsToShow += 10;
  },
  },

  components: { InputComment, Comment }
}
</script>
