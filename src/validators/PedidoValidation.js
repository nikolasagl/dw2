const { check } = require('express-validator')

module.exports = {

    validate(method) {

        switch (method) {
            case 'store':
                return [
                    check('bandeja', 'O campo Bandeja é obrigatório.')
                        .exists()
                        .isInt()
                        .not().isEmpty(),

                    check('massa', 'O campo Massa é obrigatório.')
                        .exists()
                        .isInt()
                        .not().isEmpty(),

                    check('sabor1', 'O campo Sabor Primario é obrigatório.')
                        .exists()
                        .isInt()
                        .not().isEmpty(),

                    check('sabor2', 'O campo Sabor Secundario é obrigatório.')
                        .exists()
                        .isInt()
                        .not().isEmpty(),

                    check('cobertura', 'O campo Cobertura é obrigatório.')
                        .exists()
                        .isInt()
                        .not().isEmpty(),

                    check('confeito', 'O campo Confeito é obrigatório.')
                        .exists()
                        .isInt()
                        .not().isEmpty(),

                    check('nome', 'O campo Nome é obrigatório.')
                        .exists()
                        .not().isEmpty(),

                    check('endereco', 'O campo Endereço é obrigatório.')
                        .exists()
                        .not().isEmpty(),

                    check('numero', 'O campo Número é obrigatório.')
                        .exists()
                        .not().isEmpty(),

                    check('bairro', 'O campo Bairro é obrigatório.')
                        .exists()
                        .not().isEmpty(),

                    check('telefone', 'O campo Telefone é obrigatório.')
                        .exists()
                        .not().isEmpty(),
                ]
        }
    }
}