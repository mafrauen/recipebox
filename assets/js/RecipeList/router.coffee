class RecipeList extends Backbone.Router
  routes:
    "": 'list'
    "recipes/new": 'newRecipe'
    "recipes/:id": 'show'

  initialize: =>
    @cookbook = new Cookbook()
    @cookbookView = new CookbookView el: '#recipes', collection: @cookbook
    @detailView = new RecipeDetailView collection: @cookbook
    @headerView = new HeaderView collection: @cookbook

    @cookbook.on 'recipe:selected sync', (recipe) =>
      document.title = recipe.get 'name'
      @navigate "recipes/#{recipe.get 'id'}" if recipe.get 'id'
    @cookbook.on 'add', =>
      document.title = 'New Recipe'
      @navigate 'recipes/new'#, replace: true


  list: =>
    $('#header').html @headerView.render().el
    $('#content').html @detailView.render().el
    @cookbookView.render()

  newRecipe: =>
    $('#header').html @headerView.render().el
    $('#content').html @detailView.render().el
    @cookbookView.render()

    # we don't want to do this when navigating, right?
    recipe = new Recipe
    @cookbook.add recipe
    recipe.trigger 'recipe:selected', recipe

  show: (id) =>
    $('#header').html @headerView.render().el
    $('#content').html @detailView.render().el
    @cookbookView.render()

    recipe = @cookbook.get id
    recipe.trigger 'recipe:selected', recipe

Backbone.Router.RecipeList = RecipeList
