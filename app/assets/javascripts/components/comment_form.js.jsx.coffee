@CommentForm = React.createClass(
  getInitialState: ->
    {
      author: ''
      text: ''
    }
  handleAuthorChange: (e) ->
    @setState author: e.target.value
    return
  handleTextChange: (e) ->
    @setState text: e.target.value
    return
  handleSubmit: (e) ->
    e.preventDefault()
    author = @state.author.trim()
    text = @state.text.trim()
    if !text or !author
      return
    @props.onCommentSubmit
      author: author
      text: text
    @setState text: ''
    return
  render: ->
    `<form className="form-horizontal" onSubmit={this.handleSubmit}>
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
      </form>`
)