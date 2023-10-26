<template >
  <div class="input-box h-fit w-full bg-blue ">
    <div class="flex items-center space-x-4 p-4">
      <!-- Profile Image -->
      <div class="h-12 w-12 overflow-hidden rounded-full">
        <img src="https://media.discordapp.net/attachments/898466011391610890/1166737937027825694/nsey-benajah-5_gku5Usbzk-unsplash.jpg?" alt="User Profile Image" />
      </div>
      <!-- Comment Box -->
      <div class="flex-auto">
        <form @submit.prevent="handleClick" class="flex">
          <div class="flex gap-4">
            <input id="body" v-model="commentData.body" class="bg-blue text-white h-full p-4 outline-none focus:border-transparent" type="text" placeholder="Ajouter un commentaire..." />
            <button type="submit" class="text-white">Add</button>
          </div>
        </form>
     </div>
    </div>
  </div>
</template>
<script>
export default {
  props: {
    actualityId: Number, // Assuming you have a postId prop to associate comments with a post
  },
  data() {
    return {
      commentData: {
        body: '',
        actuality_id: this.actualityId, // Associate the comment with a post
      },
      isAuthenticated: false, // Flag to track user authentication
    };
  },
  // computed: {
  //   setActualityAsInteger() {
  //     return parseInt(this.actualityId);
  //   },
  // },
  created() {
    //this.commentData.actuality_id = this.setActualityAsInteger;

    // Check user authentication status and set the `isAuthenticated` flag accordingly.
    // You can use Vuex or another state management system for this.
    this.isAuthenticated = true; // Set it based on your actual authentication status.
  },
  methods: {

    async createComment() {
      if (this.isAuthenticated) {
        try {
          const response = await this.$axios.post(`api/app/comments`, this.commentData); // Replace with your API endpoint
          // Handle the success case
        } catch (error) {
          console.error('Error creating comment:', error);
        }
      } else {
        // If the user is not authenticated, you can show a pop-up/modal or redirect to the Sign-In/Sign-Up component.
        // For example, you can use Vuex to trigger the authentication modal or route to the Sign-In component.
        // Vuex.dispatch('showAuthenticationModal');
        // Or, you can redirect the user to the Sign-In component using Vue Router.
        this.$router.push({ name: 'SignIn' });
      }
    },
    async reloadComments(actualityId){
      this.commentData.body = '';
      await this.$emit('reloadComments');
      console.log("Emited change, reloaded comments")
    },
    async handleClick(){
      try {
        await this.createComment();
        await this.reloadComments(this.actualityId)
      } catch (error) {
        console.log("Error inside comment creation" + error)
      }
    }
  }
}
</script>
