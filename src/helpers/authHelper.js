const jwt = require("jsonwebtoken")
const secret = require('../config/secret')

const AutenticacaoHelper = {

   gerarToken: (id) => {
      return jwt.sign({ id: id }, secret.secret, {
         expiresIn: 86400
      })
   }
}

module.exports = AutenticacaoHelper