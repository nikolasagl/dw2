const bcrypt = require('bcrypt')
const { validationResult } = require('express-validator')

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
                    errors: [
                        {value: '', msg: 'Alguma coisa deu errado', param: ''}
                    ]
                })  
            } else if (result === true) {
                
                res.json({
                    email: user.attributes.email,
                    name: user.attributes.login,
                    token: AutenticacaoHelper.gerarToken(user.attributes.id),
                    status: true
                })
            } else {
                res.json({
                    errors: [
                        {value: '', msg: 'Senha Incorreta', param: 'password'}
                    ]
                })  
            }
        })
    } else {
        res.json({
            errors: [
                {value: '', msg: 'Usuario não encontrado', param: 'username'}
            ]
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

async function register(req, res) {

    const erros = validationResult(req)

    if (!erros.isEmpty()) 
        return res.json({ errors: erros.errors })

    const input = req.body

    try {
        const admin = AdminModel.forge({
            email: input.email,
            login: input.username,
            senha: bcrypt.hashSync(input.password, bcrypt.genSaltSync(10))
        })

        const id = await admin.save(null, {method: 'insert'}).then((model) => {return model.id})

        if (id) {
            res.json({
                username: admin.attributes.login,
                status: true
            })
        }
    } catch (error) {
        console.log(error)  
        res.json({
            errors: [
                {value: '', msg: 'Erro ao cadastrar', param: ''}
            ]
        })      
    }
}

module.exports = {
    login,
    register,
    index
}