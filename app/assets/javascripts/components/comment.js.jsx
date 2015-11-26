var Comment = React.createClass({
  rawMarkup: function() {
    var converter = new Showdown.converter()
    var rawMarkup = converter.makeHtml(this.props.children.toString(), {sanitize: true});
    return { __html: rawMarkup };
  },

  render: function() {
    return (
      <blockquote>
        <p dangerouslySetInnerHTML={this.rawMarkup()} /> 
        <footer className="commentAuthor">
          {this.props.author}
        </footer>
      </blockquote>
    );
  }
});

