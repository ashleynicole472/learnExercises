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
