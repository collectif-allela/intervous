import { createApp } from 'vue';
import './style.css';
import App from './App.vue';
import router from './router';
import axios from 'axios'; // Import Axios

// Set up Axios defaults, e.g., API base URL
axios.defaults.baseURL = 'http://localhost:3000'; // Replace with your API base URL

const app = createApp(App);

// Use the Vue-Axios plugin
app.config.globalProperties.$axios = axios;

app.use(router).mount('#app');
