<template>
    <v-app>
    <div>
      <navbar />
      <v-main id="main">
        <router-view/>
      </v-main>
      <!--<FooTer />-->
    </div>
    </v-app>
  </template>
  

<script>
import navbar from './components/navbar.vue'
//import FooTer from './components/footer.vue'
export default {
    name: 'app',
    components: {
        navbar,
        //FooTer
    }
}


</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  background-color: rgb(226, 225, 225);
}
#card {
    background-color: #B2DFDB ;
    
}
#div {
    margin-left:15%;
    margin-right:15%;
    margin-top:5%;
    margin-bottom:15%
}

/* #btn {
    background-color: #464646;
    color:white;
} */
nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}
</style>
