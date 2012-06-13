recipe = (app, redis) =>

  key = (id) ->
    "recipe:#{id}"
  keyIngredients = (id) ->
    "#{key(id)}:ingredients"

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
    redis.lrange keyIngredients(id), 0, -1, (err, ing) ->
      recipe.ingredients = ing
      res.send recipe


  app.post '/api/recipes', (req, res) ->
    rating = 0 # TODO
    redis.incr 'id:recipe', (err, id) ->
      recipe =
        id: id
        name: req.body.name
        rating: rating
        made: 0 # TODO
      redis.hmset key(id), recipe

      redis.rpush keyIngredients(id), req.body.ingredients
      redis.zadd "recipes", rating, id

      #return to backbone any attributes that changed on the server
      res.send
        id: id
        ingredients: req.body.ingredients


  app.put '/api/recipes/:id', (req, res) ->
    id = req.params.id
    name = req.body.name
    ingredients = req.body.ingredients

    redis.hset key(id), 'name', name
    redis.del keyIngredients(id)
    redis.rpush keyIngredients(id), ingredients
    # TODO rating

    res.send
      name: name
      ingredients: ingredients


  app.delete '/api/recipes/:id', (req, res) ->
    id = req.params.id
    redis.zrem 'recipes', id
    redis.del key(id), keyIngredients(id)


module.exports = recipe
