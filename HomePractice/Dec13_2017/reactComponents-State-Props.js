import React, {Component} from 'react'
//create a class name and extend it from Compondent
class Welcome extends Component {
//render with parentasis
  render(){
    return(
      <div>
        <h3>Welcome {this.props.currentUser}</h3>
        //create a currentUser in app.js add this to the <Welcome /> = <Welcome currentUser /> and within the render within app.js add <Welcome currentUser={"Bob"}>
        //props is an object
      </div>
    );
  }
}
//export so the main page can read this information
export default Welcome from './Welcome.js'

// State is info that belongs to a Component
// Props is info that is passed between components

// To show this info on the app.js
import Welcome

// to call components

<Welcome />

var usersList =this.state.currentUsers.map(function(element){
  return(
    <welcome currentUser = {element} />
  )
})
//map function allows us to define another function this function will be done to every item in the array
//you can run javascript outside of the return but within the render function.
