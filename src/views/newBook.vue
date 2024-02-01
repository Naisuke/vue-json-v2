<template>
    <div id="app" class="div">
        <v-app>
            <br><br>
        <h1 class="text-h2">Cadastro de Livros</h1>
        <br>
        <form @submit.prevent="addBook()">
                <v-card  elevation='24' tile class="rounded-xl grey lighten-1 ml-16 mr-16 mt-16 mb-16" >
                    <div id="div">
                        <br><br>
                        <h3 class="text-h5">Coloque os dados do livro para cadastro</h3>
                        <br><br>
                        
                        <v-text-field
                        outlined
                        v-model="title"
                        label ='Nome do Titulo'
                        :error="hasEntry == true"
                        ></v-text-field>
                        <div v-if="hasEntry == true" class="red--text">Livro ja Registrado</div>
                        <br>
                        
                        <v-text-field
                        outlined
                        v-model="author"
                        label ='Nome do Autor'
                        ></v-text-field>
                        <br>

                        <v-text-field
                        outlined
                        v-model="publisher"
                        label="Nome da Editora"
                        ></v-text-field>
                        <br>

                        <v-select
                        outlined
                        v-model="genre"
                        :items="bookGenres"
                        label="Gênero Literário"
                        ></v-select>
                        <br>

                        <v-text-field
                        outlined
                        v-model="year"
                        label="Ano de Publicação"
                        v-on:keypress="validaNumber($event)"
                        :error="hasError == true"
                        ></v-text-field>
                        <div v-if="hasError == true" class="red--text">Ano Invalido</div>
                        <br>

                        <v-btn type="submit"
                        id="btn" class="green lighten-1" >Inserir</v-btn>
                        <br><br><br>
                        <router-link to="/book">
                            <v-btn type="button" class="grey darken-3 white--text" id="btn">Voltar</v-btn>
                        </router-link>
                        <br><br>
                        
                    </div>
                </v-card>
        </form>
    </v-app>
    </div>
</template>
<script>

export default{
    name: 'newBook',
    data() {
        return {
            hasError: false,
            hasEntry: false,
            called: null,
            bookGenres: ['Ação', 'Politica', 'Romance', 'Aventura', 'Biografia', 'Informativo', 'Drama', 'Horror'],
            title: null,
            author: null,
            publisher: null,
            genre: null,
            year: null
        }
    },
    methods: {
        async addBook () {
            const req = await fetch('http://localhost:3000/livros')
            const res = await req.json()
            
            console.log(res)
            res.forEach(element => {
                if (element.title == this.title){
                    this.hasEntry = true
                }else{
                    this.hasEntry = false
                }
                console.log(this.hasEntry)
            });
                

            if(this.title != null && this.author != null && this.publisher != null && this.genre != null && this.year != null){
                if (/^[0-9]+$/.test(this.year) == true 
                && 
                this.hasEntry == false
                &&
                this.year.length <= '4'
                &&
                this.year <= '2024'
                ){
                    const add = {
                        title: this.title,
                        author: this.author,
                        publisher: this.publisher,
                        genre: this.genre,
                        year: this.year
                    }
                    const jsonAdd = JSON.stringify(add)
                
                    const call = await fetch('http://localhost:3000/livros', {
                        method: 'POST',
                        headers: { 'Content-Type':'application/json'},
                        body: jsonAdd
                    })
                    const res = await call.json()
                    this.new = res;
                    location.href = '/book'
                }else{
                    this.hasError = true
                }
            }else{
                alert('Preencha todos os campos')
            }
        },

        validaNumber (e) {
            let key = String.fromCharCode(e.keyCode);
            if (/^[0-9]+$/.test(key)) return true
            else e.preventDefault()
        },

    },
    }
    //computed: {
    //    titleValido() {
    //        return /^[A-Za-z0-9]+$/.test(this.title);
    //    },
    //    authorValido() {
    //        return /^[A-Za-z0-9]+$/.test(this.author);
    //    },
    //    publisherValido() {
    //        return /^[A-Za-z0-9]+$/.test(this.publisher);
    //    },
    //    yearValido () {
    //        return /^[null0-9]+$/.test(this.year);
    //    }
    //}

</script>
<style scoped>
</style>