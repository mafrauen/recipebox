redis = require 'redis'

config = ->
  port = 9158
  host = 'fish.redistogo.com'
  auth = '344c860b048c9eabb5e4e2eb1825437d'

  setupDevelopment = ->
    # local host
    db = redis.createClient()
    return db

  setupProduction = ->
    # use nodejitsu settings
    db = redis.createClient(port, host)
    db.auth auth
    return db


  switch process.env.NODE_ENV
    when 'production'
      setupProduction()
    else
      setupDevelopment()

module.exports = config


# redis://nodejitsu:344c860b048c9eabb5e4e2eb1825437d@fish.redistogo.com:9158/
# redis://mafrauen:7e5effe44367678feead73ec2f26ee5b@panga.redistogo.com:9629/
