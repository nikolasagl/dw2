const express = require('express')
const requireDir = require('require-dir')

const routes = express.Router()

const controllers = requireDir('../controllers')

routes.get('/', controllers.UsuarioController.index)

routes.get('/pedido/:id', controllers.PedidoController.show)

routes.get('/pedido/:id/edit', controllers.PedidoController.edit)

routes.put('/pedido/:id', controllers.PedidoController.update)

routes.delete('/pedido/:id', controllers.PedidoController.del)

routes.get('/pedido/:id/restore', controllers.PedidoController.restore)

module.exports = routes