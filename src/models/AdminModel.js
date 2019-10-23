const db = require('../config/database')

var AdiminModel = db.Model.extend({
    tableName: 'admin'
})

module.exports = AdiminModel