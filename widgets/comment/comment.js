import React from 'react';
import {Widget, Helpers} from 'kitto';

import './comment.scss'

export class Comment extends Widget {
  render() {
    return (
      <div className={this.props.className}>
        <h3 className="title">
          <img className="profile-pic" src={this.state.profilePic || "http://placehold.it/50x50"}/>
          {this.state.name || this.props.title}
        </h3>
        <p className="comment">{this.state.text}</p>
        <p className="more-info">{this.props.moreinfo}</p>
        <p className="updated-at">{this.updatedAt(this.state.updated_at)}</p>
      </div>
    )
  }
}

Widget.mount(Comment);
export default Comment;
