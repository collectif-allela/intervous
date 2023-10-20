<template>
 <div class="post m-auto flex flex-col items-center justify-center gap-5">
    <h1>These are all the posts</h1>
    <input type="text" v-model="videoUrl" placeholder="Url" class="input-url w-full border border-solid border-black"/>
    <!-- <input type="checkbox" v-model="published" class="input-body w-full border border-solid border-black"/> -->

    <!-- button -->
    <div class="flex gap-4">
        <button v-if="isEditing" @click="updatePost">Update</button>
        <button v-if="isEditing" @click="cancelEdit">Cancel</button>
        <button v-else @click="createPost">Create Post</button>

      </div>
    <!-- Div of posts -->
    <div v-if="posts.length > 0" v-for="post in posts" :key="post.id">
      <h3>{{ post.id }}</h3>
      <h3>{{ post.video_url }}</h3>
      <!-- button -->
      <button  @click="editPost(post.id)">Edit</button>
      <button  @click="deletePost(post.id)">Delete</button>



    </div>
    <div v-else>
      <h2>There are no posts already</h2>
    </div>
 </div>
</template>

<script setup >
 import { ref, onMounted, onBeforeMount} from "vue";

 const API_URL = "http://localhost:3000/posts";

 const posts = ref([]);
 const videoUrl = ref('');
 const post_id = ref(0);
 let isEditing = ref(false)

 onBeforeMount (async()=> {
  const res = await fetch (API_URL);
  posts.value = await res.json()
 });

 const createPost = async() => {
  const res = await fetch (API_URL, {
    method: 'POST',
    headers: {
    'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      video_url: videoUrl.value
    })
  });

  const data = await res.json();
  posts.value.push(data);
  videoUrl.value = '';
  post_id.value = 0;

 };
//  UPDATE POST
 const updatePost = async() => {
  console.log('Updating Post ID: ' +  post_id.value);
  const res = await fetch (`${API_URL}/${post_id.value}`, {
    method: 'PUT',
    headers : {
      'Content-Type': 'aplication/json'
    },
    body: JSON.stringify({
      video_url: videoUrl.value
    })
  });
  const data = res;
  console.log('Post Data: ' + data);

  // Now, check if the 'id' is present in the response data
  if (data.id) {
    const index = posts.value.findIndex(post => post.id === data.id);
    console.log('Post Index to Update: ' + index);
    posts.value[index] = data;

    // Reset data
    videoUrl.value = '';
    post_id.value = 0;
    isEditing.value = false;
  } else {
    console.error('No "id" in the response data:', data);
    // Handle the case where the "id" is not present in the response.
  }

 };
//  EDIT POST
 const editPost = async(id) => {

    const post = posts.value.find(post => post.id === id);
    videoUrl.value = post.video_url;
    isEditing.value = true;
    post_id.value = post.id;
    window.scrollTo({
      top: 0,
      behavior: "smooth"
    });
    console.log('Edit Post ID: ' + post_id.value);

 };
 const cancelEdit = async(id) => {
    videoUrl.value = '';
    post_id.value = 0;
    isEditing.value = false;

 };

 const deletePost = async(id) => {
    await fetch(`${API_URL}/${id}`, {
      method: 'DELETE',
    })
    posts.value = posts.value.filter(post => post.id !== id )
 };


</script>
