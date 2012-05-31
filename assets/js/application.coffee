#= require jquery-1.7.1.min.js
#= require underscore-min.js
#= require backbone-min.js
#= require jade-min.js
#= require_tree RecipeList
#= require_tree RecipeDetail
#= require_tree Header

jQuery ->
  window.app = new Backbone.Router.RecipeList()
  app.cookbook.fetch()
  Backbone.history.start pushState: true
