const db = require('../config/database')

const JogadorModel = {

    getAll: async () => {

        try {
            
            const jogadores = await db('jogadores')
            
            if (jogadores.length > 0)
                return jogadores
            else
                return false
            
        } catch (error) {
            console.log(error)
            return false
        }
    },

    insert: async (data) => {
        return 'ausbdaisdbsak'
    }
}

module.exports = JogadorModel