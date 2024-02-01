<template>

<BookList/>

</template>


<script>
import { ref } from 'vue'
import BookList from '@/components/BookList.vue';

export default {
    name: 'BookView',
    components: {
        BookList,
    
    }
}
const mensagem = ref('Pagina nova')
console.log(mensagem)


</script>