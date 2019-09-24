const express = require('express')
const requireDir = require('require-dir')
const router = express.Router()

const routes = requireDir('./routes')

router.all('/', routes.PedidoRoutes)

router.all('/admin', routes.AdminRoutes)

module.exports = router