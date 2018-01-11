// let Vegetable = require('./models').Vegetable
// let Squirrels = require('./models').Squirrels
let Fruit= require('./models').Fruit

// Squirrels.create({
//   name: 'Kumquat',
//   calories: 10,
//   description: 'small miniature oranges'
// }).then(function(squirrels){
//   console.log(squirrels.get())
// }).catch(function(error){
//   console.log(error)
// })

Fruit.create({
  name: 'Kumquat',
  calories: 10,
  description: 'small miniature oranges',
  flavor: 'sour/sweet',
  color: 'orangey', //New Part
  size: 'tiny'
}).then(function(fruit){
  console.log(fruit.get())
}).catch(function(error){
  console.log(error)
})

// Vegetable.create({
//   name: 'Broccoli',
//   description: 'Tree people',
//   calories: 10,
//   color: 'Green' //New Part
// }).then(function(vegetable){
//   console.log(vegetable.get())
// }).catch(function(error){
//   console.log(error)
// })
// let Vegetable = require('./models').Vegetable
//
// Vegetable.create({
//   name: 'Squash',
//   description: 'Tasty fall vegetable.',
//   calories: 110
// }).then(function(vegetable){
//   console.log(vegetable.get())
// }).catch(function(error){
//   console.log(error)
// })
