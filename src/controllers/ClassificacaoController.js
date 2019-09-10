const ClassificacaoModel = require('../models/ClassificacaoModel')

async function index(req, res) {
    
    const classificacao = await ClassificacaoModel.classificacaoGeral()

    console.log(classificacao)

    res.render('index', {classificacao: classificacao})
}

module.exports = {
    index
}