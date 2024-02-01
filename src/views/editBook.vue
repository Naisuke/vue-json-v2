<template>
    <div id="app" class="div">
        <v-text class="text-h2 text-light-blue-darken-4">Cadastro de Livros</v-text>
        <br><br><br>
        <form @submit.prevent="updateBook()">
            <v-card  elevation='24' tile class="rounded-xl grey lighten-1 ml-16 mr-16 mt-16 mb-16" >
                <div id="div">
                        <br><br>
                        <h3 class="text-h5">Coloque os dados do livro para cadastro</h3>
                        <br><br>
                        
                        <v-text-field
                        outlined
                        v-model="title"
                        label ='Nome do Titulo'
                        ></v-text-field>
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
   
    </div>
</template>
<script>
    export default {
        name: 'editLivro',
        data () {
            return {
                hasError: false,
                bookGenres: ['Ação', 'Politica', 'Romance', 'Aventura', 'Biografia', 'Informativo', 'Drama', 'Horror'],
                title: '',
                author: '',
                publisher: '',
                genre: '',
                year: ''
            }
        },
        methods: {
            async loadBook (id) {
                const call = await fetch(`http://localhost:3000/livros/${this.$route.params.id}`)
                const called = await call.json()
                console.log(id)
                this.title = called.title
                this.author = called.author
                this.publisher = called.publisher
                this.year = called.year
                this.genre = called.genre
            },


            async updateBook (){ 
                if(this.title != null && this.author != null && this.publisher != null && this.genre != null && this.year != null){
                if (/^[0-9]+$/.test(this.year) == true 
                &&
                this.year.length <= '4'
                &&
                this.year <= '2024'){
                        const upBook = {
                            title: this.title,
                            author: this.author,
                            publisher: this.publisher,
                            year: this.year,
                            genre: this.genre
                        }
                        const dataUpdate = JSON.stringify(upBook)
                        const callUpdate = await fetch(`http://localhost:3000/livros/${this.$route.params.id}`,{ 
                            method: 'PATCH',
                            headers: { 'Content-Type':'application/json'},
                            body: dataUpdate
                        })
                        const res = await callUpdate.json()
                        this.update = res;
                        location.href = '/book'
                    }else{
                    this.hasError = true
                }
                }
            },
        


            validaNumber (e) {
                    let key = String.fromCharCode(e.keyCode);
                    if (/^[0-9]+$/.test(key)) return true
                    else e.preventDefault()
                },


            
        },
        mounted(){
            this.idLivro = parseInt(this.$route.params.id)
            console.log(`Chegou o ID: ${this.idLivro}`)

            this.loadBook(this.idLivro)
            },
        computed: {
        titleValido() {
            return /^[A-Za-z0-9]+$/.test(this.title);
        },
        authorValido() {
            return /^[A-Za-z0-9]+$/.test(this.author);
        },
        publisherValido() {
            return /^[A-Za-z0-9]+$/.test(this.publisher);
        },
        yearValido () {
            return /^[null0-9]+$/.test(this.year);
        }
    }
    }
</script>