let connection = require('./models/sequelize-connection')
let Country = require('./models/country')

// Country.findById(1).then(function(country){
//   // Do anything we like with the country object
//   console.log(country)
// }).catch(function(error){
//   console.log(error)
// })
//
//create a feild
// let sanDiego = Country.build({
//     code: 'SAN',
//     name: 'San Diego',
//     continent: 'North America',
//     region: 'South West'
// })
// sanDiego.save()
// .then(function(){
// })
// .catch(function(error){
// })
//Deleting the Created fields
// Country.all({
//     where:{
//         region: 'South West'
//     }
// })
//     .then(function(records){
//         let promises = records.map(function(country){
//             return country.destroy()
//         })
//         return Promise.all(promises)
//     })
//     .then(function(results){
//         console.log("SD is GONE!!! ")
//     })
// UPDATE THE RECORDS//

// Country.all({
//   where: {
//     region: 'Make Believe'
//   }
// })
//   .then(function(records){
//     let promises = records.map(function(country){
//       return country.destroy()
//     })
//
//     return Promise.all(promises)
//   })
//   .then(function(results){
//     console.log("They're gone!")
//   })

// ----------------------- SAMPLE DESTROY SYNTAX

// Country.all({
//     where: {
//         region: 'Make Believe'
//     }
// }).then(function(a){
//     let changes = a.map(function(country){
//         return country.destroy()
//     })
// }).catch(function(error){
//     console.log(error)
// })

// ----------------------- SAMPLE UPDATE SYNTAX

// let florin = Country.create({
//   code: 'FLR',
//   name: 'Florin',
//   continent: 'Europe',
//   region: 'Make Believe'
// })
// .then(function(country){
//     country.region = "Storyland"  // <-- this is where we update its values
//     return country.save() // a promise
//   })
//   .catch(function(error){
//       console.log(error)
//   })

// ----------------------- FIND BY AND UPDATE SYNTAX

// Country.findById(9)
//   .then(function(country){
//     country.region = "Make Believe"  // <-- this is where we update its values
//     return country.save() // a promise
//   })
//   .catch(function(error){
//       console.log(error)
//   })

// ----------------------- SAMPLE FIND MANY SYNTAX

Country.all({limit: 2})
  .then(function(countries){
      let mapped = countries.map(function(country){
          return country.get()
      })
      console.log(mapped)
  }).catch(function(error){
      console.log(error)
  })
