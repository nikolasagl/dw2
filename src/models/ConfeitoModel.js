const db = require('../config/database')
const Pedido = require('./PedidoModel')

var ConfeitoModel = db.Model.extend({
    tableName: 'confeito',

    pedidos: () => {
        return this.belongsToMany(Pedido)
    },
})

module.exports = ConfeitoModel