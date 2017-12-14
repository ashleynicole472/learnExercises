import React, { Component } from 'react';
import sampleNeo from './sample-neo.js';
import {
PageHeader,
Table
} from 'react-bootstrap';
// UntqbzzI6HoR4JWAaCIZJGCTtSY1YDZLPV0kXSfM
class App extends Component {
  constructor(props){
    super(props)
    let today = new Date()
    this.state = {
      apiKey: "UntqbzzI6HoR4JWAaCIZJGCTtSY1YDZLPV0kXSfM",
      startDate:`${today.getFullYear()}-${today.getMonth()+1}-${today.getDate()}`,
      apiUrl: "https://api.nasa.gov/neo/rest/v1/feed",
      rawData: sampleNeo,
      asteroids: []
    }
}

    componentWillMount(){
      fetch(`${this.state.apiUrl}?start_date=${this.state.startDate}&api_key=${this.state.apiKey}`).then((rawResponse)=>{

        return rawResponse.json()
      }).then((parsedResponse) => {
        let neoData = parsedResponse.near_earth_objects

        let newAsteroids = []
        Object.keys(neoData).forEach((date)=>{
          neoData[date].forEach((asteroid) =>{
            newAsteroids.push({
              id: asteroid.neo_reference_id,
              name: asteroid.name,
              date: asteroid.close_approach_data[0].close_approach_date,
              diameterMin: asteroid.estimated_diameter.feet.estimated_diameter_min.toFixed(0),
              diameterMax: asteroid.estimated_diameter.feet.estimated_diameter_max.toFixed(0),
              closestApproach: asteroid.close_approach_data[0].miss_distance.miles,
              velocity: parseFloat(asteroid.close_approach_data[0].relative_velocity.miles_per_hour).toFixed(0),
              distance: asteroid.close_approach_data[0].miss_distance.miles
            })
          })
        })
        this.setState({asteroids: newAsteroids})
      })
    }

  render() {
    return (
    <div className="App">
      <div className="container">
        <PageHeader>
        <h1><u>Meteors coming close</u></h1>
        </PageHeader>
        <blockquote id="quote" class="blockquote">
          <p class="mb-0">If the Earth gets hit by an asteroid, it's game over. It's control-alt-delete for civilization. </p>
          <footer class="blockquote-footer">Bill Nye <cite title="Source Title">BrainyQuote</cite></footer>
        </blockquote>
        <p>   Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        <img id="death" src="http://trendsupdates.com/wp-content/uploads/2009/08/AsteroidImpact.jpg" alt="Asteroid that's killing us!"/>
        <h3> ASTEROIDS THAT MIGHT KILL US </h3>

        <div class="alert alert-dismissible alert-warning">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <h4 class="alert-heading">Warning!</h4>
        <p class="mb-0">So, uh, there are four meteors that might kill us...good luck. Here is a bomb shelter link if ya need it: <a href="http://www.atlassurvivalshelters.com/" class="alert-link">save yourself</a>.</p>
</div>
         <Table>
          <thead>
            <tr class="table-primary">
              <th>Name</th>
              <th>Estimated Diameter (feet)</th>
              <th>Date of Closest Approach</th>
              <th>Distance (miles)</th>
              <th>Velocity (miles/hour)</th>
            </tr>
          </thead>
          <tbody>
            {this.state.asteroids.map((asteroid)=>{
              return(
            <tr class="table-secondary" key={asteroid.id}>
                  <td>{asteroid.name}</td>
                  <td>{asteroid.diameterMin} - {asteroid.diameterMax}</td>
                  <td>{asteroid.date}</td>
                  <td>{asteroid.distance}</td>
                  <td>{asteroid.velocity}</td>
                </tr>
              )
            })}
          </tbody>
        </Table>
      </div>
    </div>
    );
  }
}

export default App;
