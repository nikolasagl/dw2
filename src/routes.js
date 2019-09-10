const express = require('express')
const requireDir = require('require-dir')
const router = express.Router()

const routes = requireDir('./routes')

// router.get('/', routes.ClassificacaoRoutes)
router.get('/', routes.JogadorRoutes)

router.get('/jogador', routes.JogadorRoutes)

module.exports = router