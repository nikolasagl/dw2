const db = require('../config/database')
const Time = require('./TimeModel')
const Posicao = require('./PosicaoModel')

var JogadorModel = db.Model.extend({
    tableName: 'jogadores',

    time: function() {
        return this.belongsTo(Time, 'time_id', 'id')
    },

    posicao: function() {
        return this.hasOne(Posicao, 'id', 'posicao_id')
    }
})

module.exports = JogadorModel


// const JogadorModel = {

//     getAll: async () => {

//         try {
            
//             const jogadores = await db('jogadores')
            
//             if (jogadores.length > 0)
//                 return jogadores
//             else
//                 return false
            
//         } catch (error) {
//             console.log(error)
//             return false
//         }
//     },

//     insert: async (data) => {
//         return 'ausbdaisdbsak'
//     }
// }

// module.exports = JogadorModel