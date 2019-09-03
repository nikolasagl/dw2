const express = require('express')
const bodyParser = require('body-parser')
const routes = require('./src/routes')
const expressLayouts = require('express-ejs-layouts')

const app = express()

/*
    Campeonato Brasileiro

    Cadastro Jogadores
    Cadastro Tecnicos
    Cadastro Times
    Cadastro Partidas
    Cadastro Estádios

    Recursos:
    Tabela de Classificação Geral
    Campeão
    Classificados Libertadores
    Rebaixados
    Artilheiro
    Melhor Goleiro

    Tentar:
    Gerar Rodadas
    Gerar e Realizar Partidas
*/

app.use(bodyParser.urlencoded({ extended: false }))

app.set('view engine', 'ejs');
app.set('views', 'src/views');
app.use(expressLayouts)

app.use('/', routes)

app.listen(3000, () => {
    console.log('Server is running on port 3000')
})