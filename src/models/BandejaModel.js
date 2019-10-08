const db = require('../config/database')
const Pedido = require('./PedidoModel')

var BandejaModel = db.Model.extend({
    tableName: 'bandeja',

    pedidos: () => {
        return this.belongsToMany(Pedido)
    },
})

module.exports = BandejaModel