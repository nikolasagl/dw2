const db = require('../config/database')
const Jogador = require('./JogadorModel')

var PosicaoModel = db.Model.extend({
    tableName: 'posicoes',

    jogadores: () => {
        return this.belongsToMany(Jogador)
    },
})

module.exports = PosicaoModel