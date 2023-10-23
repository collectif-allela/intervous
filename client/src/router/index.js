import { createWebHistory, createRouter } from "vue-router";
import Home from "../views/Home.vue";
import Account from "../views/Account.vue";
import Dashboard from "../views/Dashboard.vue";
import Post from "../views/Post.vue";
import Register from "../views/Register.vue";
import Connection from "../views/Connection.vue";
import CreatePost from "../views/CreatePost.vue";
import EditPost from "../views/EditPost.vue";
import CreateActuality from "../views/CreateActuality.vue";
import EditActuality from "../views/EditActuality.vue";


const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/account",
    name: "Account",
    component: Account,
  },
  {
    path: "/dashboard",
    name: "Dashboard",
    component: Dashboard,
  },
  {
    path: "/register",
    name: "Register",
    component: Register,
  },
  {
    path: "/connection",
    name: "Connection",
    component: Connection,
  },
  {
    path: "/post/:id", // View for viewing a single post
    name: "Post",
    component: Post,
  },
  {
    path: "/post/:id/create", // View for creating a  post
    name: "CreatePost",
    component: CreatePost,
  },
  {
    path: "/post/:id/edit", // View for editing a post
    name: "EditPost",
    component: EditPost,
  },
  {
    path: "/actuality/:id/create", // View for create a post
    name : "CreateActuality",
    component: CreateActuality,
  },
  {
    path: "/actuality/:id/edit", // View for edit a post
    name : "EditActuality",
    component: EditActuality,
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
