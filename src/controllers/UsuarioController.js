const bcrypt = require('bcrypt')

const AutenticacaoHelper = require('../helpers/authHelper')

const AdminModel = require('../models/AdminModel')
const PedidoModel = require('../models/PedidoModel')

async function login(req, res) {
    const input = req.body

    const user = await new AdminModel({login: input.username}).fetch()

    if (user) {
        bcrypt.compare(input.password, user.attributes.senha, (err, result) => {
            if (err) {
                res.json({
                    msg: 'Alguma coisa deu errado',
                    status: false
                })
            } else if (result === true) {
                
                return res.json({
                    name: user.attributes.nome,
                    email: user.attributes.login,
                    token: AutenticacaoHelper.gerarToken(user.attributes.id),
                    status: true
                })
            } else {
                res.json({
                    msg: 'Senha incorreta',
                    status: false
                })
            }
        })
    }
}

async function index(req, res) {

    const data = await PedidoModel.forge().fetchAll({withRelated: ['pessoa', 'status', 'bandeja', 'massa', 'sabor', 'cobertura', 'confeito']})

    if (data) {
        res.json({data: data.toJSON()})
    } else {
        res.json({data: []})
    }
}

module.exports = {
    login,
    index
}