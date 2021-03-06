const express = require('express')
const requireDir = require('require-dir')

const routes = express.Router()

const controllers = requireDir('../controllers')
const validators = requireDir('../validators')
const AuthMiddleware = require('../middlewares/authMiddleware')

routes.get('/', controllers.PedidoController.index)

routes.post('/', validators.PedidoValidation.validate('store'), controllers.PedidoController.store)

routes.get('/pedido/:id', AuthMiddleware, controllers.PedidoController.show)

routes.get('/pedido/:id/edit', AuthMiddleware, controllers.PedidoController.edit)

routes.put('/pedido/:id', AuthMiddleware, controllers.PedidoController.update)

routes.delete('/pedido/:id', AuthMiddleware, controllers.PedidoController.del)

routes.get('/pedido/:id/restore', AuthMiddleware, controllers.PedidoController.restore)

module.exports = routes