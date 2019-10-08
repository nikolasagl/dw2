const express = require('express')
const requireDir = require('require-dir')
const router = express.Router()

const routes = requireDir('./routes')

router.all('/admin', routes.AdminRoutes)

router.all('/', routes.PedidoRoutes)

module.exports = router