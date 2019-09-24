const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const routes = require('./src/routes')

const app = express()

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(cors({
    origin: '*'
}))

app.use('/', routes)

app.listen(3003, () => {
    console.log('Server is running on port 3003')
})