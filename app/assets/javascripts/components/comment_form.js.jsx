var CommentForm = React.createClass({
  getInitialState: function() {
    return {author: '', text: ''};
  },
  handleAuthorChange: function(e) {
    this.setState({author: e.target.value});
  },
  handleTextChange: function(e) {
    this.setState({text: e.target.value});
  },
  handleSubmit: function(e) {
    e.preventDefault();
    var author = this.state.author.trim();
    var text = this.state.text.trim();
    if (!text || !author) {
      return;
    }
    this.props.onCommentSubmit({author: author, text: text});
    this.setState({author: '', text: ''});
  },
  render: function() {
    return (
      <form className="form-horizontal" onSubmit={this.handleSubmit}>
        <div className="form-group">
          <input
            placeholder={I18n.t('your_name')}
            className="form-control"
            type="text"
            value={this.state.author}
            onChange={this.handleAuthorChange}
          />
          <textarea
            className="form-control"
            rows="4" cols="50"
            placeholder={I18n.t('say_something')}
            value={this.state.text}
            onChange={this.handleTextChange}
          />
        </div>
        <div className="form-group">
          <input type="submit" className="btn btn-default" value="Post" />
        </div>
      </form>
    );
  }
});