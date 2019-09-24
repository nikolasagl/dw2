const db = require('../config/database')
const Pedido = require('./PedidoModel')

var CoberturaModel = db.Model.extend({
    tableName: 'cobertura',

    pedidos: () => {
        return this.belongsToMany(Pedido)
    },
})

module.exports = CoberturaModel