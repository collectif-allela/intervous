<template>
  <div class="section-commentaires relative border-x border-b border-solid border-black ">
      <div class="sticky bg-blue text-white p-5 top-0 ">
          <h3 class="text-center uppercase italic">Commentaires</h3>
      </div>
      <div v-if ="comments && comments.length >0" class="">
        <!-- Comments from actuality -->
        <div v-for="comment in comments">
          <!-- :userName="commen.user" -->
          <Comment profileImage="https://media.discordapp.net/attachments/898466011391610890/1166737937027825694/nsey-benajah-5_gku5Usbzk-unsplash.jpg?" :timestamp= "comment.created_at" :commentText = comment.body />
        </div>
        <InputComment :actualityId = actuality.id />
      </div>
      <div v-else>
        <h3 class="text-center">Soyez le premiere a commenter !</h3>
        <InputComment :actualityId = actuality.id @reloadComments="this.$emit('reloadComments')"/>
      </div>
    </div>
</template>
<script>
import InputComment from '../ui/InputComment.vue';
import Comment from '../ui/Comment.vue';
export default {
  props: {
    actuality: Object, // Comment text
    activeTab: Number,
    comments: Object
  },
  components: { InputComment, Comment }
}
</script>
