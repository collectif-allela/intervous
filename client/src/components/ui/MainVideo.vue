<template>
  <div class="relative flex h-[70vh] w-full items-end justify-start">
    <div class="w-full z-10 cursor-pointer" v-if="showDiv" @click="deleteTitle" >
      <h2 class="text-beige z-10 mb-10 ml-[20px] text-5xl uppercase italic leading-none">
        <span class="bg-blue break-words px-3">L'actu</span><br />
        <span class="bg-blue ml-[20px] px-3">du {{date}}</span>
      </h2>
    </div>
    <div class="absolute z-0 h-full w-full bg-red-400 object-cover">
      <iframe class="w-full h-full" src="https://www.youtube.com/embed/4O6QUFyf28s?si=9DQHa1mN9pzTHo_h" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      showDiv: true, // Initially show the div
    }
  },
  props: {
    date: String,
  },
  mounted() {

    console.log("Show div: " +this.showDiv)
  },
  methods: {
     deleteTitle() {
      console.log("Click " +this.showDiv)

      // Set showDiv to false to hide the div
      this.showDiv = false;
    },
  },
  name: 'MainVideo',
  // Your component's properties and methods here
}
</script>
