config = (redis) =>
  setupDevelopment = ->
    @db = redis.createClient()
    @db.select 0
    return @
  setupProduction = ->
    @db = redis.createClient(9629, 'panga.redistogo.com')
    @db.auth '7e5effe44367678feead73ec2f26ee5b'
    @db.select 2
    return @

  switch process.env.NODE_ENV
    when 'development' then setupDevelopment()
    when 'production' then setupProduction()

module.exports = config
