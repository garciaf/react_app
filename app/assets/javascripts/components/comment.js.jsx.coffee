@Comment = React.createClass(
  rawMarkup: ->
    converter = new (Showdown.converter)
    rawMarkup = converter.makeHtml(@props.children.toString(), sanitize: true)
    { __html: rawMarkup }
  render: ->
    `<blockquote>
      <p dangerouslySetInnerHTML={this.rawMarkup()} /> 
      <footer className="commentAuthor">
        {this.props.author}
      </footer>
    </blockquote>`
)