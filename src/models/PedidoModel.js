const db = require('../config/database')
const Pessoa = require('./PessoaModel')
const Status = require('./StatusModel')
const Bandeja = require('./BandejaModel')
const Massa = require('./MassaModel')
const Sabor = require('./SaborModel')
const Cobertura = require('./CoberturaModel')
const Confeito = require('./ConfeitoModel')

var PedidoModel = db.Model.extend({
    tableName: 'pedido',

    pessoa: function() {
        return this.belongsTo(Pessoa, 'pessoa_id', 'id')
    },

    status: function() {
        return this.belongsTo(Status, 'status_id', 'id')
    },

    bandeja: function() {
        return this.belongsTo(Bandeja, 'bandeja_id', 'id')
    },

    massa: function() {
        return this.belongsTo(Massa, 'massa_id', 'id')
    },

    sabor: function() {
        return this.belongsTo(Sabor, 'sabor_id', 'id')
    },

    cobertura: function() {
        return this.belongsTo(Cobertura, 'cobertura_id', 'id')
    },

    confeito: function() {
        return this.belongsTo(Confeito, 'confeito_id', 'id')
    }

})

module.exports = PedidoModel