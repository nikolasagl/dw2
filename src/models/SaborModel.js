const db = require('../config/database')
const Pedido = require('./PedidoModel')

var SaborModel = db.Model.extend({
    tableName: 'sabor',

    pedidos: () => {
        return this.belongsToMany(Pedido)
    },
})

module.exports = SaborModel