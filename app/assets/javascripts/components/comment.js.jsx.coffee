@Comment = React.createClass(
  rawMarkup: ->
    converter = new (Showdown.converter) 
    rawMarkup = converter.makeHtml(@props.model.get('text'), sanitize: true)
    { __html: rawMarkup }
  render: ->
    `<blockquote>
      <p dangerouslySetInnerHTML={this.rawMarkup()} /> 
      <footer className="commentAuthor">
        {this.props.model.get('author')}
      </footer>
    </blockquote>`
)