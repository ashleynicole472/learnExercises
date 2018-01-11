//Take your Password Checker and write in code that will notify the user when they have entered a non-valid user name and password.
//Tasks:

//For each criteria create a function that checks the string for the password or username and returns one of two objects.

//Either { valid: true } or { valid: false, reason: "User ID cannot contain $"} with the reason for the rule failing.
//Then create a main function that runs all functions and prints out all failures for all criteria one at a time.

var userName = prompt ("Create a Username");
var userPass = prompt ("Create a Password");

function checkUser (){
    if (userName.carAt < 6){
        alert ("Your Username must be 6 charaters or more");
    } else if (userName.includes("!","#", "$") === true){
        alert("You can not use ! # or $ in your Username");
    }

function checkPass (userPass){
    if (userPass.carAt < 6){
        alert ("Your Password must be 6 charaters or more");
    } else if (userPass.includes("!" || "#" || "$") === false){
        alert("Your password must have at least one of the following: ! # $");
    } else if (userPass === "password" || "Password"){
        alert("Password cannot be your password...be original!")
    }
}
