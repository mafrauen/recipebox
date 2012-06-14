staticPages = (app) =>

  renderApp = (req, res) ->
    res.render 'index', title: 'RecipeBox'

  app.get '/', renderApp
  app.get '/recipes/new', renderApp
  app.get '/recipes/:id', renderApp

module.exports = staticPages
