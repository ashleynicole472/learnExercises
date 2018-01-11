import React, { Component } from 'react';

class GoodRobot extends Component {
  render() {
    return (
      <div>
        <h2><u>Good Robot</u></h2>
        <h3>I hear you saying {this.props.greeting} . Is that correct?</h3>
      </div>
    );
  }
}

export default GoodRobot;
