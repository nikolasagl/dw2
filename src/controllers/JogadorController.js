const JogadorModel = require('../models/JogadorModel')

module.exports = {
    index: async (req, res, next) => {

        const jogadores = await JogadorModel.getAll()

        console.log(jogadores)

        res.render('jogador/index')
    },

    create: async(req, res, next) => {
        return res.end('create function')
    },

    store: async(req, res, next) => {
        return res.end('store function')
    },

    show: async(req, res, next) => {
        return res.end('show function')
    },

    edit: async(req, res, next) => {
        return res.end('edit function')
    },

    update: async(req, res, next) => {
        return res.end('update function')
    },

    delete: async(req, res, next) => {
        return res.end('delete function')
    },

    restore: async(req, res, next) => {
        return res.end('restore function')
    }
}