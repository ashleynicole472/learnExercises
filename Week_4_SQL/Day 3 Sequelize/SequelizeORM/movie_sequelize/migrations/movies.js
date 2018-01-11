//We require the movie definition setup in our model
let Movie = require('../models/movie')

//These are the sample countries we are going to create
let movies = [
  {
    name: 'movie1',
    genre: 'comedy',
  },
  {
    name: 'movie2',
    genre: 'comedy',
  },
  {
    name: 'movie3',
    genre: 'anime',
  },
  {
    name: 'movie4',
    genre: 'drama',
  },
  {
    name: 'movie5',
    genre: 'comedy',
  },
  {
    name: 'movie6',
    genre: 'thriller',
  },
  {
    name: 'movie7',
    genre: 'anime',
  },
  {
    name: 'movie8',
    genre: 'action'
  }
]

//This function will be called after the table is setup in Postgres and will insert the new records
function createRecords(){
  let promises = movies.map(function(movie){
    return new Promise(function(resolve,reject){
      return Movie.create(movie)
    })
  })

  return Promise.all(promises)
}


//sync creates the table based on the sequelize definition and returns a promise
Movie.sync({force: true})
  .then(function(){
    console.log('success! movies table created')

    //in the promise, we go ahead and create the new records.
    createRecords()
  })
  .catch(function(error){
    //Just in case something goes wrong, lets print it out
    console.log(error)
  })
