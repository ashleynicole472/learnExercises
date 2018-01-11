var port = process.argv[2];
var express = require('express');
var app = express();
app.use(express.static('public'));
app.set('view engine', 'ejs');

var jokes = {
    'Pokemon' :{
        image: '/images/pokemon.jpg',
        alt: 'Pokemon meme'
    },
    'Two Programmers' :{
        image: '/images/twoprogrammers.jpg',
        alt: 'two programmers meme'
    },
    'NLP' :{
        image: '/images/nlp.jpg',
        alt: 'natural_language_processing_meme'
    },
    'Coding' :{
        image: '/images/coding.jpg',
        alt: 'coding meme'
    },
    'Little Bobby Tables' :{
        image: '/images/exploits_of_a_mom.png',
        alt: 'Little Bobby tables meme'
    },
    'Bugs' :{
        image: '/images/bugs.jpg',
        alt: '99 Little Bugs Grumpy Cat'
    },
    'Milton Sleep' :{
        image: '/images/miltonsleep.jpg',
        alt: 'Milton sleep'
    },
    'Curly Boy' :{
        image: '/images/curlyboy.jpg',
        alt: 'Curly boy vs computer'
    },
    'Philosoraptor' :{
        image: '/images/philosoraptor.jpg',
        alt: 'Philosoraptor'
    },
    'Yep' :{
        image: '/images/yep.jpg',
        alt: 'Programmer vs. Computer'
    },
    'Help Me' :{
        image: '/images/starwars.png',
        alt: 'Star Wars Meme'
    }
};

app.get('/', function (request,response){
    response.render('index', {'jokes': jokes});
});

app.get('/jokepage/:joke', function(req, res){
    var jokekey = req.params.joke;
    var namejoke = jokes[jokekey];
    res.render('jokepage', {'image': namejoke.image, 'alt': namejoke.alt});
});

app.listen(process.argv[2], function() {
  console.log('listening on ' + port);
});
