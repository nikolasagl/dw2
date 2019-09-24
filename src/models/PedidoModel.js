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
        return this.hasOne(Status, 'id', 'status_id')
    },

    bandeja: function() {
        return this.hasOne(Bandeja, 'id', 'bandeja_id')
    },

    massa: function() {
        return this.hasOne(Massa, 'id', 'massa_id')
    },

    sabor1: function() {
        return this.hasOne(Sabor, 'id', 'sabor1_id')
    },

    sabor2: function() {
        return this.hasOne(Sabor, 'id', 'sabor2_id')
    },

    cobertura: function() {
        return this.hasOne(Cobertura, 'id', 'cobertura_id')
    },

    confeito: function() {
        return this.hasOne(Confeito, 'id', 'confeito_id')
    },

})

module.exports = PedidoModel