recipe = (app, redis) =>

  recipes = []
  redis.smembers 'recipes', (err, ids) ->
    keys = ("recipe:#{id}" for id in ids)

    multi = redis.multi()
    for key in keys
      multi.hgetall key, (err, res) ->
        recipes.push res
      multi.lrange "#{key}:ingredients", 0, -1, (err, res) ->
        recipes[recipes.length-1].ingredients = res
    multi.exec()


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
      recipe =
        id: id
        name: req.body.name
      redis.hmset key, recipe

      redis.rpush "#{key}:ingredients", req.body.ingredients
      redis.sadd "recipes", id

      recipe.ingredients = req.body.ingredients
      recipes.push recipe

      #return to backbone any attributes that changed on the server
      res.send id: id


  app.put '/api/recipes/:id', (req, res) ->
    id = req.params.id
    key = "recipe:#{id}"

    redis.hset key, 'name', req.body.name
    ingKey = "#{key}:ingredients"
    redis.del ingKey
    redis.rpush ingKey, req.body.ingredients

    for recipe in recipes when recipe.id is id
      recipe.name = req.body.name
      recipe.ingredients = req.body.ingredients

    res.send {}


  app.delete '/api/recipes/:id', (req, res) ->
    id = req.params.id
    redis.srem 'recipes', 0, id
    redis.del "recipe:#{id}", "recipe:#{id}:ingredients"

    index = idx for rec, idx in recipes when rec.id is id
    recipes.splice index, 1

module.exports = recipe
