<template>
    <div id="app">
        <v-card>
        <v-navigation-drawer app class="grey lighten-1"
        permanent
        :mini-variant.sync="mini"
        v-model="drawer"
        mini-variant-width="150"
        width="400"
        >
            <v-list-item>
                <v-list-item-icon>
                    <v-icon size="50">mdi-alpha-b-box</v-icon>
                </v-list-item-icon>
                <v-list-item-title>{{ appTitle }}</v-list-item-title>
            
            <v-btn
            icon
            @click.stop="mini = !mini"
            ><v-icon >mdi-chevron-left</v-icon>
            </v-btn>
            </v-list-item>
            <v-divider></v-divider>
            <v-list dense>
            <v-list-item 
            class="text-white"
            link
            :title= 'item.title'
            v-for = 'item in navItems'
            :key = "item.title"
            :to="item.path"
            ><v-list-item-icon>
                <v-icon size="35">{{ item.icon }}</v-icon>
            </v-list-item-icon>
            <v-list-item-title class="subtitle-1">
                {{ item.title }}
            </v-list-item-title>
            
            </v-list-item>
        </v-list>
        </v-navigation-drawer>
    </v-card>
    </div>
  </template>
  <script>
  export default {
        name: 'App',
        data () {
            return {
                drawer: true,
                mini: true,
                appTitle: 'Biblioteca Vue JSON',
                navItems: [
                    {title: 'Home', path: '/', icon: 'mdi-home-circle'},
                    {title: 'Lista de livros', path: '/book', icon: 'mdi-list-box'},
                    {title: 'Novo Livro', path: '/newBook', icon: 'mdi-book-edit-outline'}
                ]
            }
        }
    }
</script>

<!--<template>
    <div id="app">
        <v-navigation-drawer app class="grey lighten-1"
        permanent
        expand-on-hover
        >
            <v-list-item title="Biblioteca">{{ appTitle }}</v-list-item>
            <v-divider></v-divider>
            <v-list nav>
            <v-list-item 
            class="text-white"
            link
            :title= 'item.title'
            v-for = 'item in navItems'
            :key = "item.title"
            :to="item.path"
            ><v-list-item-icon><v-icon>{{ item.icon }}</v-icon></v-list-item-icon>{{ item.title }}</v-list-item>
        </v-list>
        </v-navigation-drawer>
    </div>
  </template>-->