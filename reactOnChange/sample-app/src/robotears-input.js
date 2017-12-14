import React, { Component } from 'react';

class RobotearsInput extends Component {
    handleChange(newinput){
        this.props.updateGreeting(newinput)
    }

    render() {
        return (
            <input value={this.props.greeting} onChange={this.handleChange.bind(this)} />
    )
  }
}
  export default RobotearsInput;
