const express = require('express')
const requireDir = require('require-dir')

const routes = express.Router()

const controllers = requireDir('../controllers')

routes.get('/', controllers.JogadorController.index)

routes.get('/create', controllers.JogadorController.create)

routes.post('/', controllers.JogadorController.store)

routes.get('/:id', controllers.JogadorController.show)

routes.get('/:id/edit', controllers.JogadorController.edit)

routes.put('/:id', controllers.JogadorController.update)

routes.delete('/:id', controllers.JogadorController.delete)

routes.get('/:id/restore', controllers.JogadorController.restore)

module.exports = routes