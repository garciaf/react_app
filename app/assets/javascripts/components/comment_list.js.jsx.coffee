@CommentList = React.createClass(
  mixins: [Backbone.React.Component.mixin]
  render: ->
    commentNodes = @getCollection().map((comment) ->
      `<Comment author={comment.get('author')} key={comment.id}>
        {comment.get('text')}
      </Comment>`
    )
    `<div>
      {commentNodes}
    </div>`
)