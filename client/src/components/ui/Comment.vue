<template>
  <div class="comment-box h-fit w-full border-b border-black">
    <div class="flex items-center space-x-4 px-4">
      <!-- Profile Image -->
      <div class="h-12 w-12 overflow-hidden rounded-full">
        <img :src="profileImage" alt="User Profile Image" />
      </div>

      <!-- Comment Body -->
      <div class="flex-1 justify-evenly">
        <div class="rounded-lg p-4">
          <div class="flex w-fit gap-2">
            <h3 class="text-bold font-bold uppercase italic">{{ userName }}</h3>
            <p class="italic text-gray-400">{{ timestamp }}</p>
          </div>
          <p class="text-gray-800">{{ commentText }}</p>
          <div class="mt-4 flex w-full justify-between items-center">
            <span>{{likes}}</span>
            <button @click="likeComment" class="mx-2 flex items-center gap-2" :class="likeButtonClass">
              <Like :fillColor="likeFillColor"/>
            </button>
            <span>{{dislikes}}</span>
            <button @click="unlikeComment" :fillColor="dislikeFillColor" class="mr-2 flex items-center gap-2 " :class="dislikeButtonClass">
              <Dislike :fillColor="dislikeFillColor"/>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Like from '../../assets/Like.vue';
import Dislike from '../../assets/Dislike.vue'
export default {
  data() {
    return {
      data:{
        id: null,
        content_id: this.commentId,
        user_id: 1,
        vote_type: '',
        content_type: "comment"
      },
      likes: '',
      dislikes: '',
      likeFillColor: 'none', // Initial fill color for Like button // Initial class for Like button
      dislikeFillColor: 'none', // Initial class for Dislike button
      userVoted: false, // Set this to true if the user has already liked the comment
    };
  },
  props: {
    commentId: Number,
    profileImage: URL, // URL to the user's profile image
    //userName: String, // User's name
    timestamp: String, // Timestamp of the comment
    commentText: String, // Comment text
  },
  components: {Like, Dislike},

  mounted() {
    this.fetchLikes();
    this.fetchDisLikes();
  },
  methods: {
    async fetchLikes(){
      try {
          const currentVoteData = await this.$axios.get(`api/app/votes`,{
          params:
          {vote_type: 'like',
          content_id : this.data.content_id,
          content_type: this.data.content_type
         },
        });
          if (currentVoteData.data){
            // Assign the voteId to data
            this.data.id = currentVoteData.data.id;
            console.log("Comment is liked with vote ID: " + this.data.id);
          } else (
            console.log("Vote not found: ")
          )
          const response = await this.$axios.get(`api/app/votes/count`,{
          params:
          {
          vote_type: 'like',
          content_id : this.data.content_id,
          content_type: this.data.content_type
         },
        });
          if (response.data) {
            const currentLikes = response.data.count;

            this.likes = currentLikes;
            console.log('Likes fetched successfully');
          } else {
            console.log('Problem fetching likes.');
          }
        } catch (error) {
          console.log('Error liking comment:', error);
        }
    },
    async fetchDisLikes(){
      try {
          const response = await this.$axios.get(`api/app/votes/count`,{
          params:
          {vote_type: 'dislike',
          content_id : this.data.content_id,
          content_type: this.data.content_type
         },
        });
          if (response.data) {
            const commentDisLikes = response.data.count;
            this.dislikes = commentDisLikes;
            console.log('Dislikes fetched successfully');
          } else {
            console.log('Problem fetching likes.');
          }
        } catch (error) {
          console.log('Error liking comment:', error);
        }
    },
    async likeComment() {
  if (!this.userVoted) {
    // Make an API call to like the comment
    try {
      // Update the fill color for the Like button
      this.likeFillColor = 'red';
      this.data.vote_type = 'like';

      const response = await this.$axios.post(`api/app/votes`, this.data);

      if (response.data) {
        console.log('Added like to BD');
        // Update the likes count
        this.likes++;
      } else {
        console.log('Response data is undefined or empty.');
      }
    } catch (error) {
      window.alert('Error liking comment, try again later', error);
    }
    // Update the userVoted state to true
    this.userVoted = true;
  } else {
    // Make an API call to remove the like
    try {
      this.data.vote_type = 'like';
      console.log("Unliking vote:" + this.data.id);
      const response = await this.$axios.delete(`api/app/votes/delete_by_criteria`, this.data);

      if (response.data) {
        console.log('Removed like to BD');
        // Update the likes count
        this.likes--;
      } else {
        console.log('Response data is undefined or empty.');
      }
    } catch (error) {
      console.log('Error unliking comment, try again later', error);
    }
    // Update the userVoted state to false
    this.userVoted = false;
  }
}
,
    async unlikeComment() {
      if (!this.userVoted) {
        // Make an API call to like the comment
        try {
          this.dislikeFillColor = 'gray';
          this.data.vote_type = 'dislike';
          const response = await this.$axios.post(`api/app/votes`, this.data);

          if (response.data) {
            console.log('Vote added dislike');
            // Update the dislikes count
            this.dislikes++;
          } else {
            console.log('Response data is undefined or empty.');
          }
        } catch (error) {
          window.alert('Error disliking comment, try again later', error);
        }
        // Update the userVoted state to true
        this.userVoted = true;
      }
    },
  }
}
</script>
