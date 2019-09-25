const { validationResult } = require('express-validator')
const PedidoModel = require('../models/PedidoModel')
const PessoaModel = require('../models/PessoaModel')
const BandejaModel = require('../models/BandejaModel')
const MassaModel = require('../models/MassaModel')
const SaborModel = require('../models/SaborModel')
const CoberturaModel = require('../models/CoberturaModel')
const ConfeitoModel = require('../models/ConfeitoModel')
const moment = require('moment')

async function index(req, res, next) {

    const data = {
        bandejas: await BandejaModel.fetchAll().then((bandejas) => {
            return bandejas.serialize()
        }).catch(err => console.log(err)),

        massas: await MassaModel.fetchAll().then((massas) => {
            return massas.serialize()
        }).catch(err => console.log(err)),

        sabores: await SaborModel.fetchAll().then((sabores) => {
            return sabores.serialize()
        }).catch(err => console.log(err)),

        coberturas: await CoberturaModel.fetchAll().then((coberturas) => {
            return coberturas.serialize()
        }).catch(err => console.log(err)),

        confeitos: await ConfeitoModel.fetchAll().then((confeitos) => {
            return confeitos.serialize()
        }).catch(err => console.log(err))
    }

    return res.json(data)
}

async function store(req, res, next) {

    const erros = validationResult(req)

    if (!erros.isEmpty()) 
        return res.json({ errors: erros.errors })

    const input = req.body

    try {
        const pessoa = PessoaModel.forge({
            nome: input.nome,
            endereco: input.endereco,
            numero: input.numero,
            bairro: input.bairro,
            telefone: input.telefone
        })
        const id = await pessoa.save(null, {method: 'insert'}).then((model) => {return model.id})
    
        console.log(id)
    
        if (id !== null) {
    
            const data_pedido = moment().toDate()
            const data_entrega = moment().toDate()
    
            console.log(data_pedido)
            console.log(data_entrega)
    
            const pedido = await PedidoModel.forge({
                bandeja_id: input.bandeja,
                massa_id: input.massa,
                sabor1_id: input.sabor1,
                sabor2_id: input.sabor2,
                cobertura_id: input.cobertura,
                confeito_id: input.confeito,
                pessoa_id: id,
                data_pedido: data_pedido,
                data_entrega: data_entrega,
                status_id: 1,
                preco: 100
            }).save(null, {method: 'insert'}).then((model) => console.log(model))
            
            console.log(pedido)
        }

    } catch (error) {
        console.log(error)
    }
}

async function show(req, res, next) {
    return res.end('show function')
}

async function edit(req, res, next) {
    return res.end('edit function')
}

async function update(req, res, next) {
    return res.end('update function')
}

async function del(req, res, next) {
    return res.end('delete function')
}

async function restore(req, res, next) {
    return res.end('restore function')
}

module.exports = {
    index,
    store,
    show,
    edit,
    update,
    del,
    restore
}
