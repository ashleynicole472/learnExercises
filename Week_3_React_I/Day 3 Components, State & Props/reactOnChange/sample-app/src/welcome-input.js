import React, { Component } from 'react';

class WelcomeInput extends Component {
  handleChange(e){
    this.props.updateGreeting(e)
  }

  render() {
    return (
      <input value={this.props.greeting} onChange={this.handleChange.bind(this)} />
    );
  }
}

export default WelcomeInput;
