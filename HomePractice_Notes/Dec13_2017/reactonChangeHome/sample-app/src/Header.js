import React, { Component } from 'react';

class Header extends Component {
  render() {
    return (
        <h3>{this.props.greeting}</h3>
    )
  }
}

export default Header;
