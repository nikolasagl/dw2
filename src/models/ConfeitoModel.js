const db = require('../config/database')
const Pedido = require('./PedidoModel')

var ConfeitoModel = db.Model.extend({
    tableName: 'confeito',

    pedidos: () => {
        return this.hasMany(Pedido, 'confeito_id', 'id')
    }
})

module.exports = ConfeitoModel