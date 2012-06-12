#= require lib/jquery-1.7.1.min.js
#= require lib/underscore-min.js
#= require lib/backbone-min.js
#= require lib/handlebars.runtime-1.0.0.beta.6
#= require_tree templates
#= require_tree RecipeList
#= require_tree RecipeDetail
#= require_tree Header

jQuery ->
  window.app = new Backbone.Router.RecipeList()
  app.cookbook.fetch()
  Backbone.history.start pushState: true
