const db = require('../config/database')
const Jogador = require('./JogadorModel')

var TimeModel = db.Model.extend({
    tableName: 'times',

    jogadores: () => {
        return this.hasMany(Jogador)
    },
})

module.exports = TimeModel