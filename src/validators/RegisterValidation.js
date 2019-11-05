const { check } = require('express-validator')
const AdminModel = require('../models/AdminModel')

module.exports = {

    validate(method) {

        switch (method) {
            case 'store':
                return [
                    check('email')
                        .exists().withMessage('O campo Email é obrigatório.')
                        .not().isEmpty().withMessage('O campo Email é obrigatório.')
                        .isEmail().withMessage('Digite um Email válido.')
                        .custom(async (value, {req}) => await AdminModel.query('where', 'email',  req.body.email).fetch().then(user => {if (user) return Promise.reject('Email já cadastrado')})),

                    check('username', 'O campo Login é obrigatório.')
                        .exists()
                        .not().isEmpty(),

                    check('password', 'O campo Senha é obrigatório.')
                        .exists()
                        .not().isEmpty()
                ]
        }
    }
}