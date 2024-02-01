<template>
    <div id="div">
        <v-text class="text-h2">Tabela de Livros Cadastrados</v-text>
        <br><br><br>
        <router-link to="/newBook">
                <v-btn type="button" class="green lighten-1 "><v-icon>mdi-plus</v-icon>CADASTRAR LIVRO</v-btn>
        </router-link>
        <br><br>
        <v-card>
            <v-card-title>Tabela de Livros
                <v-spacer></v-spacer>
                <v-text-field
                v-model="search"
                label="Buscar Item"
                
                hide-details>
                </v-text-field>
            </v-card-title>
            
            <v-data-table
            :headers="headers"
            :items="livros"
            :items-per-page="5"
            :search="search"
            :footer-props="{
                itemsPerPageText: 'Itens por pagina' 
            }"
            class="elevation-1"
            fixed-header
            dense
            >
            
                <template v-slot:[`item.action`]="{ item }">
                    <router-link :to="{name: 'editBook', params: {id: item.id}}">
                        <v-btn class="blue lighten-2 ">
                            <v-icon>mdi-pencil</v-icon>
                        </v-btn>
                    </router-link>
                    <v-btn @click="deleteBook(item.id)" class="red lighten-1">
                        <v-icon>mdi-delete</v-icon>
                    </v-btn>
                </template>
            
            </v-data-table>
        </v-card>
    </div>
</template>
        

<script>
export default{
    name: 'BookList',
    data(){
        return {
            search: "",
            headers: [
                 { text: '#', value: 'id', align: 'start', sortable: 'false' },
                { text: 'Título', value: 'title', align: 'start' },
                { text: 'Autor', value: 'author', align: 'start' },
                { text: 'Editora', value: 'publisher', align: 'start' },
                { text: 'Ano', value: 'year', align: 'start' },
                { text: 'Gênero', value: 'genre', align: 'start' },
                { text: 'Ação', value: 'action', align: 'end' }
            ],
            livros: []
        }
    },
    methods: {
        async getBooks () {
        const req = await fetch('http://localhost:3000/livros')
        const res = await req.json()
        this.livros = res;
        console.log(this.livros)
        },
        async deleteBook (id) {
            const call = await fetch(`http://localhost:3000/livros/${id}` , {
                method: 'DELETE'
            })
            const res = await call.json() 
            this.delete = res;
            console.log(this.delete)
            this.getBooks()
        }
    },
        
    mounted () {
        this.getBooks()
    }
}

</script>
<style scoped>

table, th, td {
  margin-left: auto;
  margin-right: auto;
  
}
th, td {
    padding:20px;
    text-align: center;
    border-bottom: 1px solid
}

</style>
<!--
<template>
    <div id="div">
        <v-text class="text-h2">Tabela de Livros Cadastrados</v-text>
        <br><br><br>
        <router-link to="/newBook">
                <v-btn type="button" class="green lighten-1 "><v-icon>mdi-plus</v-icon>CADASTRAR LIVRO</v-btn>
        </router-link>
        <br><br>
        <v-simple-table class="mt-2 align-center"
        fixed-header
        :items-per-page="5"
        > 
            <thead class="bg-red text-center" >
                <tr>
                    <th>Id</th>
                    <th>Titulo</th>
                    <th>Autor</th>
                    <th>Editora</th>
                    <th>Genero</th>
                    <th>Ano</th>
                    <th>Açôes</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="livro in livros " :key="livro.id" :items-per-page="5" >
                    <td>{{ livro.id }}</td>
                    <td>{{ livro.title }}</td>
                    <td>{{ livro.author }}</td>
                    <td>{{ livro.publisher }}</td>
                    <td>{{ livro.genre }}</td>
                    <td>{{ livro.year }}</td>
                    <td><router-link :to="{name: 'editBook', params: {id: livro.id}}">
                            <v-btn class="blue lighten-2 "><v-icon>mdi-pencil</v-icon>Editar</v-btn>
                            
                    </router-link><v-btn @click="deleteBook(livro.id)" class="red lighten-1"><v-icon>mdi-delete</v-icon> Excluir</v-btn></td>
                </tr>
            </tbody>
        </v-simple-table>
        
        
    </div>
</template>-->