const db = require('../config/database')
const Pedido = require('./PedidoModel')

var FormaModel = db.Model.extend({
    tableName: 'forma',

    pedidos: () => {
        return this.belongsToMany(Pedido)
    },
})

module.exports = FormaModel