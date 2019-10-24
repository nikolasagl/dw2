const db = require('../config/database')
const Pedido = require('./PedidoModel')

var StatusModel = db.Model.extend({
    tableName: 'status',

    pedidos: () => {
        return this.hasMany(Pedido, 'status_id', 'id')
    }
})

module.exports = StatusModel