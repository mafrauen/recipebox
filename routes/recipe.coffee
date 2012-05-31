recipe = (app) =>

  recipes = []
  recipes.push id: 1, name: 'Recipe 1', ingredients: ['butter']
  recipes.push id: 2, name: 'Recipe 2', ingredients: ['potatoes', 'sour cream']
  id = 3

  renderApp = (req, res) ->
    res.render 'index', title: 'My Recipes'

  app.get '/', renderApp
  app.get '/recipes/new', renderApp
  app.get '/recipes/:id', renderApp

  app.get '/api/recipes', (req, res) ->
    res.send recipes

  app.post '/api/recipes', (req, res) ->
    recipe = req.body
    recipe.id = id++
    recipes.push recipe
    res.send id: recipe.id

module.exports = recipe
