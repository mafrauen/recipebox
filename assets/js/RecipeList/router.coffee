class RecipeList extends Backbone.Router
  routes:
    "": 'list'
    "recipes/new": 'newRecipe'
    "recipes/:id": 'show'

  initialize: =>
    @cookbook = new Cookbook()
    @cookbookView = new CookbookView  collection: @cookbook
    @detailView = new RecipeDetailView collection: @cookbook
    @headerView = new HeaderView collection: @cookbook

    @cookbook.on 'recipe:selected sync', (recipe) =>
      document.title = recipe.get 'name'
      @navigate "recipes/#{recipe.get 'id'}" if recipe.get 'id'
    @cookbook.on 'add', =>
      document.title = 'New Recipe'
      @navigate 'recipes/new'


  list: =>
    $('#content').html @detailView.render().el
    $('#recipes').html @cookbookView.render().el
    $('#recipes').prepend @headerView.render().el

  newRecipe: =>
    $('#content').html @detailView.render().el
    $('#recipes').html @cookbookView.render().el
    $('#recipes').prepend @headerView.render().el

    # we don't want to do this when navigating, right?
    recipe = new Recipe
    @cookbook.add recipe
    recipe.trigger 'recipe:selected', recipe

  show: (id) =>
    $('#content').html @detailView.render().el
    $('#recipes').html @cookbookView.render().el
    $('#recipes').prepend @headerView.render().el

    recipe = @cookbook.get id
    recipe.trigger 'recipe:selected', recipe

Backbone.Router.RecipeList = RecipeList
