const { check } = require('express-validator')

module.exports = {

    validate(method) {

        switch (method) {
            case 'store':
                return [
                    check('bandeja', 'O campo Bandeja é obrigatório.')
                        .exists()
                        .not().isEmpty()
                        .isInt(),

                    check('massa', 'O campo Massa é obrigatório.')
                        .exists()
                        .not().isEmpty()
                        .isInt(),

                    check('sabor', 'O campo Sabor é obrigatório.')
                        .exists()
                        .not().isEmpty()
                        .isInt(),

                    check('peso', 'O campo Peso é obrigatório.')
                        .exists()
                        .not().isEmpty()
                        .isInt(),

                    check('preco', 'O campo Preco é obrigatório.')
                        .exists()
                        .not().isEmpty()
                        .isInt(),

                    check('cobertura', 'O campo Cobertura é obrigatório.')
                        .exists()
                        .not().isEmpty()
                        .isInt(),

                    check('confeito', 'O campo Confeito é obrigatório.')
                        .exists()
                        .not().isEmpty()
                        .isInt(),

                    check('nome', 'O campo Nome é obrigatório.')
                        .exists()
                        .not().isEmpty(),

                    check('email')
                        .exists().withMessage('O campo Email é obrigatório.')
                        .not().isEmpty().withMessage('O campo Email é obrigatório.')
                        .isEmail().withMessage('Digite um email válido.'),

                    check('endereco', 'O campo Endereço é obrigatório.')
                        .exists()
                        .not().isEmpty(),

                    check('numero', 'O campo Número é obrigatório.')
                        .exists()
                        .not().isEmpty(),

                    check('bairro', 'O campo Bairro é obrigatório.')
                        .exists()
                        .not().isEmpty(),

                    check('telefone')
                        .exists().withMessage('O campo Telefone é obrigatório.')
                        .not().isEmpty().withMessage('O campo Telefone é obrigatório.')
                        .isNumeric().withMessage('Digite um número de telefone válido.'),

                    check('data_entrega')
                        .exists().withMessage('O campo Data de Entrega é obrigatório.')
                        .not().isEmpty().withMessage('O campo Data de Entrega é obrigatório.')
                        .isISO8601().withMessage('Digite uma data válida.'),
                ]
        }
    }
}