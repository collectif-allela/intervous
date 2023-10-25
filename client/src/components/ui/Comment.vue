<template >
  <div class="comment-box flex h-fit w-full border border-solid border-black">
    <div class="flex items-center space-x-4 p-4">
      <!-- Profile Image -->
      <div class="h-16 w-16 overflow-hidden rounded-full">
        <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png" alt="User Profile Image" />
      </div>

      <!-- Comment Body -->
      <div class="flex-1 justify-evenly">
        <div class="rounded-lg p-4">
          <div class="flex w-fit gap-2">
            <h3 class="text-bold font-bold uppercase italic">Dedecito</h3>
            <p class="italic text-gray-400">- 2 minutes ago</p>
          </div>
          <p class="text-gray-800">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla scelerisque odio ac justo vestibulum, nec dictum arcu ultrices.</p>
          <div class="mt-4 flex w-full justify-between">
            <button class="mx-2 flex items-center gap-2 text-gray-600 hover:text-blue">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
              </svg>
              Like
            </button>
            <button class="mr-2 flex items-center gap-2 text-gray-600 hover:text-red-500">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
              </svg>
              Dislike
            </button>
            <button class="flex items-center gap-2 text-gray-600 hover:text-green-500">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 3.016V10h6M12 21v-6M12 10v8" />
              </svg>
              Respond
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {

}
</script>
