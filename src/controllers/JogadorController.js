const JogadorModel = require('../models/JogadorModel')


async function index(req, res, next) {

    const jogadores = await JogadorModel.collection().fetch({ withRelated: ['time', 'posicao'] }).then((jogadores) => {
        return jogadores.serialize()
    }).catch(err => console.log(err))
    console.log(jogadores)

    res.render('jogador/index', {jogadores: jogadores})
}

async function create(req, res, next) {
    return res.end('create function')
}

async function store(req, res, next) {
    return res.end('store function')
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
    create,
    store,
    show,
    edit,
    update,
    del,
    restore
}
