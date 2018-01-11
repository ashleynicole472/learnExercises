let connection = require('./models/sequelize-connection')
let Movie = require('./models/movie')
//
// connection.authenticate()
//   .then(function(){
//     console.log('success!')
//   })
//   .catch(function(error){
//     console.log(error)
//   })


Movie.all({limit: 10})
  .then(function(movies){
      let mapped = movies.map(function(movie){
          return movie.get()
      })
      console.log(mapped)
  }).catch(function(error){
      console.log(error)
  })
