import React, { Component } from 'react';

class GreetingInput extends Component {
  handleChange(e){
    this.props.updateGreeting(e.target.value)
  }

  render(){
    return (
      // this input doesnt have state so we pass greeting we want through props
      <input value={this.props.greeting}
       onChange={this.handleChange.bind(this)} />
    )
  }
}
 export default GreetingInput;
