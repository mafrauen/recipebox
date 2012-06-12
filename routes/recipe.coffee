recipe = (app, redis) =>

  key = (id) ->
    "recipe:#{id}"
  ingredients = (id) ->
    "#{key(id)}:ingredients"

  renderApp = (req, res) ->
    res.render 'index', title: 'My Recipes'

  app.get '/', renderApp
  app.get '/recipes/new', renderApp
  app.get '/recipes/:id', renderApp

  app.get '/api/recipes', (req, res) ->
    redis.zrevrange 'recipes', 0, -1, (err, ids) ->
      command = redis.multi()
      command.hgetall key(id) for id in ids
      command.exec (err, recipes) ->
        res.send recipes

  app.get '/api/recipes/:id', (req, res) ->
    id = req.params.id
    redis.hgetall key(id), (err, hash) ->
      recipe = hash
    redis.lrange ingredients(id), 0, -1, (err, ing) ->
      recipe.ingredients = ing
      res.send recipe

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
