const express = require('express')
const requireDir = require('require-dir')
const router = express.Router()

const routes = requireDir('./routes')

router.use('/', routes.PedidoRoutes)

router.use('/admin', routes.AdminRoutes)

module.exports = router