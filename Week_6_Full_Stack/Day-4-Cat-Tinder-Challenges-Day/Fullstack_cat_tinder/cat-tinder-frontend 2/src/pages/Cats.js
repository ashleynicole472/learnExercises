import React, { Component } from 'react';
import {
  Col,
  ListGroup,
  ListGroupItem,
  Row,
  Button
} from 'react-bootstrap'



class Cats extends Component {
  render() {
    return (
    <div class="container">
      <Row>
        <Col xs={12}>
          <ListGroup>
            {this.props.cats.map((cat, index) =>{
              return (

                <ListGroupItem
                  key={index}
                  header={
                    <h4>
                    <a href={`/cats/${cat.id}`}>
                      <span className='cat-name'>
                        {cat.name}
                      </span>
                      </a>
                      - <small className='cat-age'>{cat.age} years old</small>
                    </h4>
                  }>
                      <span className='cat-city'>
                        Location: {cat.city}
                      </span> <br />
                      <span className='cat-enjoys'>
                        {cat.enjoys}
                      </span>
                      <br />
                      <br />
                      <Button bsStyle="danger">Delete Profile</Button>
                </ListGroupItem>
              )
            })}
          </ListGroup>
        </Col>
      </Row>
    </div>
    );
  }
}
export default Cats
