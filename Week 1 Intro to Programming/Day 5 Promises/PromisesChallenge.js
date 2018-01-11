function reverseText(text, callback){
  let splitText = text.split("")
  let reverseArray = splitText.reverse()
  callback(reverseArray.join(""))
}

function capitalizeText(text, callback){
  callback(text.toUpperCase())
}


// reverse capitalize

function reverse(text){
    var splitText = text.split("");
    var reverseArray = splitText.reverse();

    return new Promise(function(resolve, reject){
        if (splitText){
            resolve(reverseArray.join(""));
        }else {
            reject("Error no text.")
        }
    })
}

reverse("I hope this works").then(function(result){
    console.log(result)
}).catch(function(err){
    console.log(err)
})

function capitalWord(text){
    var capitalize = text.toUpperCase();

    return new Promise(function(resolve,reject){
        if(capitalize){
        resolve(capitalize);

            // console.log(reverse.toUpperCase() )
        }else{
            reject("error nothing entered!")
        }
    })
}

reverse("I hope this works").then(function(result){
    return capitalWord(result)

}).then(function(result){
    console.log(result)
}).catch(function(err){
    console.log(err)
})

// var cleanRoom = new Promise(function(resolve,reject){
//   let cleanRoom = true
//
//   if(cleanRoom){
//     resolve("Good job!")
//   } else{
//     reject ("Go clean your room!")
//   }
// })
//
// cleanRoom.then(function(result){
//   console.log(result)
// }).catch(function(err){
//   console.log(err)
// })

// let myPromise = new Promise(function(resolve, reject){
//
//   let isSuccess = true //just as an example
//
//   if(isSuccess){
//     resolve("the data")
//   }else{
//     reject("reason it failed")
//   }
// })
//
// myPromise.then(function(result){
//   console.log("success: " + result)
// }).catch(function(result){
//   console.log("failed: " + result)
// })
