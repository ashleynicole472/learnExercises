import React, { Component } from 'react';
import apartments from "./store/Apartments";
import {Link} from 'react-router-dom';

class ApartmentIndex extends Component {
    componentWillMount(){
        this.setState({apartments: apartments})
    }
  render() {
      let list = this.state.apartments.map(function(apartment){
          return(
            <li key={apartment.id}>
              <Link to={`/apartments/${apartment.id}`}>
                {apartment.name}
              </Link>
            </li>
         )
      })
    return (
      <ul>
        {list}
      </ul>
    );
  }
}

export default ApartmentIndex;
