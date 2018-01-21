// Create webpage that allows a user to play the Hi/lo game.
// Create a function that plays the following game: The computer picks a secret random integer between 1 and 100 (both inclusive), and repeatedly asks the user for guesses.
//
// var guessNum = prompt("Please guess my number!");


// if (guessNum != randomNum) {
//     document.getElementById("inputNum").innerHTML =
//     "Try again";
// }

// random number function
var computersRandomNumber = Math.floor(Math.random() * 20);

var guessCount = 0;

    function computersNumber() {
        console.log(computersRandomNumber)
    // If the users guess is too high or too low, the computer notifies them of that; and if the user guesses the secret number correctly, the computer displays a winning message and the game is over.
    var inputNumber = parseInt(document.getElementById("inputNumber").value);

    guessCount++;
    console.log(guessCount)


    if (inputNumber < computersRandomNumber && guessCount <=7) {
        alert ("Too low! Guess again!!")
    }
    else if (inputNumber > computersRandomNumber && guessCount <=7) {
        alert ("Too high! Guess again!!")
    }
    else if (inputNumber === computersRandomNumber) {
        alert ("Yay! You won!!")
    computersRandomNumber = Math.floor(Math.random() * 20);
    }
    else if(guessCount > 7){
        alert("Game over! You couldn't guess in 7 tries!");
    }
}

// Validate the users input. If the user puts a anything other than a number, tell the user they can only use numbers, can clear the input field.
// Allow the user to put there name in before the game starts. When the user has won the game, let the user know they have won, using their name.
