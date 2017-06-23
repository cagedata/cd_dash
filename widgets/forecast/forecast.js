import React from 'react';
import {Widget} from 'kitto';

import './forecast.scss';

class Forecast extends Widget {
  render() {
    return (
      <div className={this.props.className}>
        <h1 className="title">{this.props.title}</h1>
        <h2 className="temp">{this.state.temperature}</h2>
        <p className="summary">{this.state.summary}</p>
        <p className="more-info">{this.props.moreinfo}</p>
        <p className="updated-at">{this.updatedAt(this.state.updated_at)}</p>
      </div>
    );
  }
}

Widget.mount(Forecast);
export default Forecast;
