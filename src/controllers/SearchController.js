const PedidoModel = require('../models/PedidoModel')
const moment = require('moment')

async function search(req, res) {
    const input = req.body

    try {
        var results = await PedidoModel.where('id', input.id !== '' ? parseInt(input.id) : '')
        .orWhere('preco', input.preco)
        .orWhere('data_pedido', input.data_pedido !== '' ? moment(input.data_pedido).format('YYYY-MM-DD') : '')
        .orWhere('data_entrega', input.date_entrega !== '' ? moment(input.data_entrega).format('YYYY-MM-DD') : '')
        .orWhere('status_id', input.status !== '' ? parseInt(input.status) : '')
        .orWhereHas('pessoa', q => {
            q.where('nome', 'like', input.nome !== '' ? `%${input.nome}%` : '')
        })
        .with('status')
        .with('pessoa')
        .get()
        
        const result = results.toJSON()

        res.json(result)
    } catch (error) {
        console.log(error)
    }
}

async function find(req, res) {
    const input = req.body

    console.log(input.id)

    try {
        var data = await PedidoModel.where('id', input.id)
        .with('status')
        .with('pessoa')
        .with('bandeja')
        .with('massa')
        .with('sabor')
        .with('cobertura')
        .with('confeito')
        .get()

        const result = data.toJSON()
        
        console.log(result)

        res.json(result)
    } catch (error) {
        console.log(error)        
    }
}

module.exports = {
    search,
    find
}