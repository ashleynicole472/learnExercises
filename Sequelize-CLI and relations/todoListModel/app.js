let ToDoList = require('./models').ToDoList

// ToDoList.create({
//     status: false,
//     description: 'Do laundry'
// }).then(function(todolist) {
//     console.log(todolist.get())
// }).catch(function(error){
//     console.log(error)
// })

ToDoList.all().then(function(todolist){
  let mapped = todolist.map(function(todolist){
    return todolist.get()
  })
  console.log(mapped)
})
