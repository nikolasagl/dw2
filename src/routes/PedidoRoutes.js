const express = require('express')
const requireDir = require('require-dir')

const routes = express.Router()

const controllers = requireDir('../controllers')
const validators = requireDir('../validators')

routes.get('/', controllers.PedidoController.index)

routes.post('/', validators.PedidoValidation.validate('store'), controllers.PedidoController.store)

module.exports = routes