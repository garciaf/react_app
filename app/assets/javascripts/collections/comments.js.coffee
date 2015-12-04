MyApp.Collections.Comments = Backbone.Collection.extend
  model: MyApp.Models.Comment
  url: '/comments.json'