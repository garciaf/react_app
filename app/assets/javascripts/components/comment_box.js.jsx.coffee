@CommentBox = React.createClass(
  mixins: [Backbone.React.Component.mixin]

  handleCommentSubmit: (comment_hash) ->
    @getCollection().create comment_hash, wait: true,
      error: ((xhr, status, err) ->
        console.error @props.url, status, err.toString()
      ).bind(this)
  componentWillMount: ->
    @chatRoom = window.pusher.subscribe('comment')
    notify.requestPermission()
    comments = new MyApp.Collections.Comments
    comments.reset(JSON.parse(@props.comments))
    @onCollection @, comments
  componentWillUnmoun: -> 
    @off(@)
  componentDidMount: ->
    @chatRoom.bind 'new_comment', ((data) ->
      existing_comment = @getCollection().add(data)
      new_comment = @getCollection().get(data.id)
      new_comment.notifyUser()
      ), this

  render: ->
    `<div className="commentBox">
        <h1>Comments</h1>
        <CommentList collection={this.getCollection()} />
        <CommentForm onCommentSubmit={this.handleCommentSubmit} />
      </div>`
)