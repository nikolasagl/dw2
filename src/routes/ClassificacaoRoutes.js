const express = require('express')
const requireDir = require('require-dir')

const routes = express.Router()

const controllers = requireDir('../controllers')

routes.get('/', controllers.ClassificacaoController.index)

module.exports = routes