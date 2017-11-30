
//Create array with elements provided :
var answers = ["Yup!", "Fuhgeddaboudit", "Maybe", "Ask: what would your mother do?", "Ask: what would an Australian do, then do the opposite", "Your answer here."]


// Generate a random number that is between 0 - length of my answers array
var ranNum = Math.floor(Math.random() * answers.length)


// Create a prompt that will ask the user a question and store their answer into a variable
var ball8Ma = prompt("I am the all knowing Magic 8 Ball. Ask me your question!!")

// Create a while loop that will check if the user has input the word stop
// if user input is not the word stop, return an alert with an element
// from the array answers, after that, ask them a question again
while(ball8Ma !== "stop"){
  var ranNum = Math.floor(Math.random() * answers.length);
  alert(answers[ranNum]);
  ball8Ma = prompt("I am the all knowing Magic 8 Ball. Ask me your question!!")
}





/*Create a function that determines if a given name is amongst the names.
var givenName = prompt("What is your name?");

function nameMatch() {
    family.forEach(function(n) {
        if(n == givenName) {
            console.log("Yay! You're a match!");
        }
    })
}
nameMatch()*/
