<template>
  <form @submit.prevent="registerUser" class="flex flex-col max-w-lg">
    <label for="email">Email:</label>
    <input class="text-black" type="email" id="email" v-model="user.email" required>
    <label for="name">Name:</label>
    <input class="text-black" type="text" id="name" v-model="user.name" required>
    <label for="nickname">Nickname:</label>
    <input class="text-black" type="text" id="nickname" v-model="user.nickname" required>
    <label for="password">Password</label>
    <input class="text-black" type="text" id="password" v-model="user.password" required>
    <label for="password_confirmation">password_confirmation</label>
    <input class="text-black" type="text" id="password_confirmation" v-model="user.password_confirmation" required>
    <button type="submit">Submit</button>
  </form>
</template>

<script>
import axios from 'axios';

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
      const response = await axios.post('http://localhost:3000/api/app/auth', this.user)

      console.log(response);
      // Check if the registration was successful based on the API response
      if (response.status === 201) {
        // Registration successful, you can redirect the user or show a success message
        console.log('Registration successful');
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
