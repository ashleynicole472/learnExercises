var express = require('express')
var app = express()
var bodyParser = require('body-parser')
app.use(bodyParser.json())

var Word = require('./models').Word

app.get('/', (req, res)=>{
  Word.findAll({limit: 1}).then((word)=>{
    res.json({
      greeting: "Hello World",
      wordOfTheDay: word[0]
    })
  })
})

app.post('/words', (req, res)=>{
  Word.create({
    word: req.body.word,
    type: req.body.type,
    definition: req.body.definition
  }).then((word)=>{
    res.status(201)
    res.json({word: word})
  })
})
module.exports = app
