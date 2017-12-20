let Sequelize = require('sequelize')

module.exports = new Sequelize( 'movies', 'learn','postgres', {
  host: 'localhost',
  dialect: 'postgres',
  pool: { // the pool determines how many connections we can have at one time
    max: 5,
    min: 0
  }
})
