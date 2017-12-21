let ToDoList = require('./models').ToDoList

//toggles between true and false depending on the current status of the index
//change index number to change from false to true.
ToDoList.findById(2).then(function(todolist){
    todolist.status = todolist.status ? false: true;
//saves new entry
  return todolist.save()
}).catch(function(error){
  console.log(error)
})

// function statusUpdate() {
//     if (ToDoList.status === false){
//         console.log("Incomplete");
//     } else if (ToDoList.status === true){
//         console.log("Complete");
//     } else {
//         console.log('function not running.')
//     }
// }
// statusUpdate()
