class RecipeList extends Backbone.Router
  routes:
    "": 'list'
    "recipes/new": 'newRecipe'
    "recipes/:id": 'show'

  title: (value) =>
    "RecipeBox - #{value}"

  initialize: =>
    @cookbook = new Cookbook()
    @cookbookView = new CookbookView  collection: @cookbook
    @detailView = new RecipeDetailView collection: @cookbook
    @headerView = new HeaderView collection: @cookbook

    @cookbook.on 'recipe:selected sync', (recipe) =>
      @current = recipe
      document.title = @title recipe.get('name')
      @navigate "recipes/#{recipe.get 'id'}" if recipe.get 'id'
    @cookbook.on 'add', (recipe) =>
      @current = recipe
      document.title = @title 'New Recipe'
      @navigate 'recipes/new', replace: true
    @cookbook.on 'destroy', (recipe) =>
      if @current is recipe
        @current = null
        @navigate ''


  list: =>
    $('#content').html @detailView.render().el
    $('#recipes').html @cookbookView.render().el
    $('#recipes').prepend @headerView.render().el

  newRecipe: =>
    $('#content').html @detailView.render().el
    $('#recipes').html @cookbookView.render().el
    $('#recipes').prepend @headerView.render().el
    @cookbook.add new Recipe

  show: (id) =>
    $('#content').html @detailView.render().el
    $('#recipes').html @cookbookView.render().el
    $('#recipes').prepend @headerView.render().el

    recipe = @cookbook.get id
    recipe.trigger 'recipe:selected', recipe

Backbone.Router.RecipeList = RecipeList
