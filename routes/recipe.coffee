recipe = (app, redis) =>

  recipes = []
  redis.get 'id:recipe', (err, cnt) ->
    getById [1..cnt] if cnt > 0

  renderApp = (req, res) ->
    res.render 'index', title: 'My Recipes'

  app.get '/', renderApp
  app.get '/recipes/new', renderApp
  app.get '/recipes/:id', renderApp

  app.get '/api/recipes', (req, res) ->
    res.send recipes

  app.post '/api/recipes', (req, res) ->
    redis.incr 'id:recipe', (err, id) ->
      key = "recipe:#{id}"
      redis.hmset key,
        id: id
        name: req.body.name
      redis.lpush "#{key}:ingredients", req.body.ingredients

      res.send id: id


  getById = (ids) ->
    keys = ("recipe:#{id}" for id in ids)

    multi = redis.multi()
    for key in keys
      multi.hgetall key, (err, res) ->
        recipes.push res
      multi.lrange "#{key}:ingredients", 0, -1, (err, res) -> 
        recipes[recipes.length-1].ingredients = res
    multi.exec()

module.exports = recipe
