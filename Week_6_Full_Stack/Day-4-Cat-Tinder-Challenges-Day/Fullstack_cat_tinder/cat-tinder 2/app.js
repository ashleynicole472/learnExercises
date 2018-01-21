var express = require('express');
var cors = require('cors')
var bodyParser = require('body-parser')
var validator = require('express-validator')
var app = express();
var Cat = require('./models').Cat

app.use(express.static('public'))
app.use(validator())
app.use(bodyParser.json())
app.use(cors())

app.get('/', (req, res) => {
  res.json({message: 'API Example App'})
});

app.get('/cats', (req, res) => {
  Cat.findAll().then( (cats) =>{
    res.json({cats:cats})
  })
})

app.get('/cats/:id', (req, res) => {
  var numViews;
    Cat.findById(req.params.id).then( (cat) =>{

      //getting current number of views on page
        numViews = cat.views;
        console.log("Numviews before update: " + numViews);
        console.log("TYpe of numviews: " + typeof(numViews))
        numViews = numViews+1;
        Cat.update({
          views: numViews
        }, {
          where: {
            id: req.params.id
          }
        }).then(() => {console.log("Updated ID" + req.params.id + "number of views" + numViews)});
        res.json({cat:cat})
    })
})



app.post('/cats', (req, res) => {
  // We setup a validation check for 'name'
  req.checkBody('name', 'Is required').notEmpty()
  req.checkBody('city', 'Is required').notEmpty()
  req.checkBody('age', 'Is required').notEmpty()
  req.checkBody('enjoys', 'Is required').notEmpty()
  // Now we can run our validations
  req.getValidationResult()
    .then((validationErrors) =>{

      // If there are no errors, go ahead and create cat
      if(validationErrors.isEmpty()){
        Cat.create({
          name: req.body.name,
          city: req.body.city,
          age: req.body.age,
          enjoys: req.body.enjoys
        }).then((cat)=>{
          res.status(201)
          res.json({cat: cat})
        })
      }else{

        // Uh ohh,  there were validation issues.  Report them back to the user.
        res.status(400)
        res.json({errors: {validations: validationErrors.array()}})
      }
    })
})



module.exports = app
