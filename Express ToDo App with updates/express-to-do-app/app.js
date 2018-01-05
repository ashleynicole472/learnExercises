var express = require('express');
var expressLayouts = require('express-ejs-layouts')
var bodyParser = require('body-parser')
var app = express();
var TodoList = require('./models').TodoList;
var Todo = require('./models').Todo;

app.use(express.static('public'))
app.use(bodyParser.urlencoded({ extended: false }))
app.set('view engine', 'ejs')
app.use(expressLayouts)

//This gets the to do lists on the root page.
app.get('/', function (request, response) {
  TodoList.findAll().then(function(todoLists){
    response.render('index', {todoLists: todoLists})
  }).catch(function(error){
    response.send("Error, couldn't fetch TodoLists")
  })
});

//This gets a list of to do in the selected to do lists,
app.get('/todo-list/:id', function(request, response){
  TodoList.findById(request.params.id,
    {include: [{
      model: Todo,
      as: 'todos'
    }]
  }).then(function(todoList){
    response.render('todo-list', {todoList: todoList, todos: todoList.todos})
  }).catch(function(error){
    response.send("Error, couldn't fetch TodoList")
  })
});

//flags the todo item as complete
app.post('/todo-list/:todoListId/todo/:id/complete', function(request, response){
  Todo.findById(request.params.id).then(function(todo){
    todo.isComplete = true
    return todo.save()
  }).then(function(todo){
    response.redirect("/todo-list/" + request.params.todoListId)
  }).catch(function(error){
    response.send("Error, couldn't fetch Todo")
  })
});

//adds input field for user to add more Todos
app.post('/todo-list/:todoListId/todo/new', function(request, response){
  TodoList.findById(request.params.todoListId).then(function(todoList){
    return todoList.createTodo({
      name: request.body.name,
      isComplete: false
    })
  }).then(function(todo){
    response.redirect("/todo-list/" + request.params.todoListId)
  }).catch(function(error){
    response.send("Error, couldn't create Todo")
  })
});

// to delete items from the todo

app.post('/todo-list/:todoListId/todo/:id/delete', function(request, response){
  Todo.findById(request.params.id).then(function(todo){
    return todo.destroy()
  }).then(function(todo){
    response.redirect("/todo-list/" + request.params.todoListId)
  }).catch(function(error){
    response.send("Error, couldn't fetch Todo")
  })
});

//to undo completed items on the todo list
app.post('/todo-list/:todoListId/todo/:id/incomplete', function(request, response){
  Todo.findById(request.params.id).then(function(todo){
    todo.isComplete = false
    return todo.save()
  }).then(function(todo){
    response.redirect("/todo-list/" + request.params.todoListId)
  }).catch(function(error){
    response.send("Error, couldn't fetch Todo")
  })
});

//the code to create a new todoList
app.post('/todo-list/new', function(request, response){
  TodoList.create({
      name: request.body.name
  }).then(function(todoList){
    response.redirect("/")
  }).catch(function(error){
    response.send("Error, couldn't create Todo")
  })
});

//possibly delete todo lists
app.post('/todo-list/:todoListId/delete', function(request, response){
  TodoList.findById(request.params.id).then(function(todoList){
    return todolist.destroy()
}).then(function(todoList){
    response.redirect("/" + request.params.todoListId)
  }).catch(function(error){
    response.send("Error, couldn't fetch Todo")
  })
});

app.listen(3000, function () {
 console.log('Example app listening on port 3000!');
});
