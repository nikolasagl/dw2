const express = require('express')
const requireDir = require('require-dir')

const routes = express.Router()

const controllers = requireDir('../controllers')
const AuthMiddleware = require('../middlewares/authMiddleware')
const validators = requireDir('../validators')

routes.post('/login', controllers.UsuarioController.login)

routes.post('/register', validators.RegisterValidation.validate('store'), controllers.UsuarioController.register)

routes.get('/', AuthMiddleware, controllers.UsuarioController.index)

routes.post('/search', controllers.SearchController.search)

routes.post('/find', controllers.SearchController.find)

module.exports = routes