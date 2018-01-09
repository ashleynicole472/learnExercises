import React, { Component } from 'react'
import Apartments from './store/Apartments'
import {Link} from 'react-router-dom'

class ApartmentDetail extends Component {
  constructor(props){
    super(props)
    this.state = {
      apartments: Apartments
    }
  }
  componentWillMount(){
    const id = this.props.match.params.id
    this.setState({apartmentId: id})
    let apartment = this.state.apartments.find(function(listing){
      return listing.id === parseInt(id)
    })
    if(apartment){
      this.setState({apartment: apartment})
    }
  }

  render() {
    return (
      <div>
        <Link to='/'>Home</Link>
        <h2>{this.state.apartment.name}</h2>
        <br />
        <img src={this.state.apartment.photo} />
        <p> {this.state.apartment.rent}
        <br />
        {this.state.apartment.lease}
        <br />
        {this.state.apartment.details}
        <br />
        {this.state.apartment.pets}
        <br />
        {this.state.apartment.contact}
        <br />
        </p>
      </div>
    );
  }
}

export default ApartmentDetail;
