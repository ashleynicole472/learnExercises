var port = process.argv[2];
var express = require('express');
var app = express();

// app.get('/hello/:name', function (request, response){
//   var name = request.params["name"];
//   response.send("Hello " + name + ".  Welcome!");
// });

// 01 Routing Challenges
// app.get('/home/:name', function (request, response){
//   var name = request.params["name"];
//   response.send("Hello World!!" + name);
// });

// As a user when I go to the path /reverse any text I add after
//the second / will be reversed
// app.get('/reverse/:name', function (request, response){
//   var name = request.params["name"];
//   var reverseText = name.split('').reverse().join('');
//   response.send("Hello World!!" + reverseText);
// });

// As a user when I go to the path /add with two params, those two params are added together
// app.get('/add/:a&:b', function (request, response){
//   var a = request.params['a'];
//   var b = request.params['b'];
//   var numA = parseInt(a);
//   var numB = parseInt(b);
//   var add = numA + numB;
//   var sum = add.toString();
//   response.send(sum);
// })

// As a user when I go to the path /piglatin any text I add after the second slash is displayed, but in pig latin. Plus signs (+) are converted to spaces in the output.
app.get('/home/:platin', function(request, response){
  var urlParameters = request.params["platin"];
  var pig = function (urlParameters) {
      var result = [];
      urlParameters = urlParameters.split("+");
      var translate = function(x){
          var tag = "";
          var pos = x.search(/[aieou]/i);
          if(pos == 0){
              tag = "way";
              return x + tag;
          }else if(pos > 0){
              tag = x.slice(0,pos);
              return x.slice(pos) + tag + "ay";
          }
      }
      for(let iter = 0; iter < urlParameters.length; iter++){
          result.push(translate(urlParameters[iter]));
      }
      var piggy = result.join(" ");
      return piggy;
  }
  response.send(pig(urlParameters));
})

app.listen(process.argv[2], function() {
  console.log('listening on ' + port);
});
