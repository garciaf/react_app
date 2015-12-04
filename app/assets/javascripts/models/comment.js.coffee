MyApp.Models.Comment = Backbone.Model.extend
  urlRoot: '/comments.json'
  
  validate: (attributes, options) ->
    author = attributes.author.trim()
    text = attributes.text.trim()
    if !text or !author
      return "can't text or author be blank"
  
  notifyUser: ->
    if notify.permissionLevel() == notify.PERMISSION_GRANTED
      notify.createNotification @get('author'),
        body: @get('text')
        icon: 'images/chat.ico'
  