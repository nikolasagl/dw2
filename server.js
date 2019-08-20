const express = require('express')
const bodyParser = require('body-parser')
const jogadorRouter = require('./src/routes/JogadorRoutes')

const app = express()

/*
    Campeonato Brasileiro

    Cadastro Jogadores
    Cadastro Times
    Cadastro Partidas

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

app.use(bodyParser.json())

app.use('/jogador', jogadorRouter)

app.listen(3000, () => {
    console.log('Server is running on port 3000')
})