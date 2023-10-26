<template>
  <section class="relative mx-auto h-[800px] w-[390px]">
    <div class="h-full w-full bg-beige">
      <div class="flex h-full flex-col justify-center items-center">
        <div class="mx-auto mb-10">
          <h1 class="inline-block bg-blue px-3 text-2xl uppercase italic text-beige">Connexion</h1>
        </div>
        <form @submit.prevent="registerUser" class="mb-6 mx-6 flex max-w-lg flex-col gap-y-3">
          <div>
            <label for="email" class="mb-1 text-sm uppercase italic">Email</label>
            <input class="w-full border border-solid border-black bg-beige p-1 text-sm text-black focus:border-blue focus:outline-none focus:ring-0" type="email" id="email" v-model="user.email" required />
          </div>
          <div>
            <label for="email" class="mb-1 text-sm uppercase italic">Mot de passe</label>
            <input class="mb-5 w-full border border-solid border-black bg-beige p-1 text-sm text-black focus:border-blue focus:outline-none focus:ring-0" type="password" id="password" v-model="user.password" required />
          </div>
          <button class="border border-black mx-auto inline-block bg-blue px-6 py-1 uppercase italic text-beige" type="submit">Se connecter</button>
        </form>
        <router-link class="underline text-black" to="/register">S'inscrire</router-link>
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
    async registerUser() {
    try {
      
      console.log(this.user);

      const response = await axios.post('/api/app/auth/sign_in', this.user, {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
    },
    });

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
