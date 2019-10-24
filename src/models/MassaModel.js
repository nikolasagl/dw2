const db = require('../config/database')
const Pedido = require('./PedidoModel')

var MassaModel = db.Model.extend({
    tableName: 'massa',

    pedidos: () => {
        return this.hasMany(Pedido, 'massa_id', 'id')
    }
})

module.exports = MassaModel