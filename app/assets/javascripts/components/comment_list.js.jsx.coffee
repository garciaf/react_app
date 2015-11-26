@CommentList = React.createClass(
  render: ->
    commentNodes = @props.comments.map((comment) ->
      `<Comment author={comment.author} key={comment.id}>
        {comment.text}
      </Comment>`
    )
    `<div>
      {commentNodes}
    </div>`
)