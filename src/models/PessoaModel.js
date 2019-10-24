const db = require('../config/database')
const Pedido = require('./PedidoModel')

var PessoaModel = db.Model.extend({
    tableName: 'pessoa',

    pedidos: () => {
        return this.hasMany(Pedido, 'pessoa_id', 'id')
    }
})

module.exports = PessoaModel