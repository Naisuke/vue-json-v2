<template>
    <v-card>
        <v-footer 
        class="grey lighten-1 footer"
        fixed>
            <v-card-text class="grey lighten-1 text-center">
                <!--<v-btn
                v-for="item in items"
                :key="item"
                class="mx-2 grey lighten-1"
                plain
                >
                <v-icon>{{ item.icon }}</v-icon>
                </v-btn>-->
                <v-card-text>Biblioteca Vue Json</v-card-text>
                <v-divider></v-divider>
                <v-card-text >
                    {{ new Date().getFullYear() }} — <strong>Vuetify</strong>
                </v-card-text>
            </v-card-text>
        </v-footer>
    </v-card>
</template>
<script>
export default {
    name: 'FOOTER',
    data() {
        return {
            items: [
                {title: 'home', icon: 'mdi-home'},
                {title: 'pencil', icon: 'mdi-pencil'},
                
                
            ],
        }
    },
}
</script>
<style>
/*footer {
    margin-left:13%
}*/
</style>