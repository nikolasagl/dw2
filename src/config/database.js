const config = require('../knexfile')
const knex = require('knex')(config)
const bookshelf = require('bookshelf')(knex)

module.exports = bookshelf.plugin(require('bookshelf-eloquent'))