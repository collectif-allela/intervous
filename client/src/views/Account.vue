<template>
  <div class="flex items-center justify-center mt-10 mb-10">
    <logo />
  </div>
  <section class="mx-auto relative max-w-[390px]">
    <div class="flex h-full flex-col">
      <div class="flex h-full flex-col">
        <div class="flex min-h-[30%] border border-black">
            <div class=" flex h-16 w-16  overflow-hidden rounded-full m-auto">
              <img src="https://media.discordapp.net/attachments/898466011391610890/1166737937027825694/nsey-benajah-5_gku5Usbzk-unsplash.jpg?" alt="User Profile Image" />
            </div>
          <ul class="flex w-full flex-col">
            <li class="flex h-full w-full items-center border border-l-black border-b-black p-2">
              <p class="h-fit text-base">TIMOTHY RICK</p>
            </li>
            <li class="flex h-full w-full items-center border border-l-black p-2">
              <p class="h-fit text-base">@TIMOTHY RICK</p>
            </li>
          </ul>
        </div>
        <ul class="flex h-full w-full flex-col border border-b-black border-l-black border-r-black">

          <li class="flex h-full items-center px-2 justify-between border border-b-black ">
            <p class="py-3 flex items-center h-full w-4/5 uppercase border-r border-black">paramétres</p>
            <button class="w-1/5 flex justify-center"><arrow/></button>
          </li>

           <li class="flex h-full items-center px-2 justify-between border border-b-black ">
            <p class="py-3 flex items-center h-full w-4/5 uppercase border-r border-black">CONFIDENTIALITE</p>
            <button class="w-1/5 flex justify-center"><arrow/></button>
          </li>
           <li class="flex h-full items-center px-2 justify-between border border-b-black ">
            <p class="py-3 flex items-center h-full w-4/5 uppercase border-r border-black">STATISTIQUES</p>
            <button class="w-1/5 flex justify-center"><arrow/></button>
          </li>
           <li class="flex h-full items-center px-2 justify-between  ">
            <p class="py-3 flex items-center h-full w-4/5 uppercase border-r border-black">favoris</p>
            <button class="w-1/5 flex justify-center"><arrow/></button>
          </li>

        </ul>
      </div>
      <div class="flex h-full items-end mt-36">
        <button  @click="logout" class="w-full border border-black p-5 text-start uppercase">Déconexion</button>
      </div>
    </div>
  </section>
</template>

<script>
import axios from 'axios';
import logo from '../assets/logo.vue';
import arrow from '../assets/arrow.vue';
import querystring from 'querystring';

export default {
  components: { logo,
  arrow },
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

    logout() {
      // Make an API request to the logout endpoint
      axios.delete('/api/app/auth/sign_out')
        .then(() => {
          // Clear the authentication token on the client side (e.g., from local storage)
          localStorage.removeItem('authToken');
          console.log("logout");
          // You may want to perform additional logout actions, such as redirecting to the login page.
        })
        .catch(error => {
          // Handle logout errors
        });
    },

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
