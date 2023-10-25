<template>
  <section class="relative mx-auto h-[800px] w-[390px]">
    <div class="h-full w-full bg-beige">
      <div class="flex h-full flex-col justify-center items-center">
        <div class="mx-auto mb-10">
          <h1 class="inline-block bg-blue px-3 text-2xl uppercase italic text-beige">Compte</h1>
        </div>
        <form @submit.prevent="updateUser" class="mb-6 mx-6 flex max-w-lg flex-col gap-y-3">
          <div>
            <label for="email" class="mb-1 text-sm uppercase italic">Pseudo</label>
            <input class="w-full border border-solid border-black bg-beige p-1 text-sm text-black focus:border-blue focus:outline-none focus:ring-0" type="nickname" id="nickname" v-model="user.nickname" required />
          </div>
          <div>
            <label for="email" class="mb-1 text-sm uppercase italic">Email</label>
            <input class="w-full border border-solid border-black bg-beige p-1 text-sm text-black focus:border-blue focus:outline-none focus:ring-0" type="email" id="email" v-model="user.email" required />
          </div>
          <div>
            <label for="email" class="mb-1 text-sm uppercase italic">Mot de passe</label>
            <input class="w-full border border-solid border-black bg-beige p-1 text-sm text-black focus:border-blue focus:outline-none focus:ring-0" type="password" id="password" v-model="user.password" required />
          </div>
          <div>
            <label for="email" class="mb-1 text-sm uppercase italic">Confirmation mot de passe</label>
            <input class="mb-5 w-full border border-solid border-black bg-beige p-1 text-sm text-black focus:border-blue focus:outline-none focus:ring-0" type="password" id="password_confirmation" v-model="user.password_confirmation" required />
          </div>
          <button class="border border-black mx-auto inline-block bg-blue px-6 py-1 uppercase italic text-beige" type="submit">S'iscrire</button>
        </form>
      </div>
    </div>
  </section>
</template>

<script>
import axios from 'axios';
import querystring from 'querystring';

export default {
  data() {
    return {
      user : {
        email: '',
        name: '', 
        nickname: '',
        password: '',
        password_confirmation: ''
      }
    }
  },
  methods: {

    async fetchuser() {
      try {
        // Replace this with an API call to fetch the post data to be edited
        const userId = this.$route.params.id; // Assuming you're using Vue Router
        const response = await axios.get(`/api/app/users/${userId}`);
        this.user = response.data; // Update postData with the fetched post data
      } catch (error) {
        console.error('Error fetching post data:', error);
      }
    },

    async updateUser() {
    try {
      
      const userId = this.$route.params.id; // Assuming you're using Vue Router
      const response = await axios.put(`/api/app/users/${userId}`, this.user);
      // Optionally, you can handle the response, e.g., show a success message or navigate back to the Dashboard
      console.log('user updated:', response.data);
      this.$router.push({ name: 'Dashboard' });

      console.log(response);
      // Check if the registration was successful based on the API response
      if (response.status === 200) {
        // Registration successful, you can redirect the user or show a success message
        console.log('Registration successful');
        this.$router.push({ name: 'Home' });
        // Redirect to a new page or show a success message
      } else {
        // Registration failed for some reason, handle the error
        console.error('Registration failed:', response.data.errors);
        // Display an error message to the user, or handle it in your preferred way.
      }
    } catch (error) {
      // Handle network or other errors
      console.error('Error during registration:', error);
      // Display an error message or handle the error as needed.
    }
  }
  }
}
</script>
