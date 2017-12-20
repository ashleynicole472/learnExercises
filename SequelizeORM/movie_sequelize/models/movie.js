let Sequelize = require('sequelize')
let connection = require('./sequelize-connection')

let movie = connection.define('movie',{
  name: {
    type: Sequelize.STRING,
    field: 'name'
  },
  genre: {
    type: Sequelize.STRING,
    field: 'genre'
  },
  createdAt: {
    type: Sequelize.DATE,
    field: 'created_at'
  },
  updatedAt: {
    type: Sequelize.DATE,
    field: 'updated_at'
  }
})







module.exports = movie
