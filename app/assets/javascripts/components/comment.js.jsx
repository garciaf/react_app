var Comment = React.createClass({
  rawMarkup: function() {
    var converter = new Showdown.converter()
    var rawMarkup = converter.makeHtml(this.props.children.toString(), {sanitize: true});
    return { __html: rawMarkup };
  },

  render: function() {
    return (
      <div className="comment">
        <small className="commentAuthor">
          {this.props.author}
        </small>
        <span dangerouslySetInnerHTML={this.rawMarkup()} />
      </div>
    );
  }
});

