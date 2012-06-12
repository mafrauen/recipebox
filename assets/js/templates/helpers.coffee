  Handlebars.registerHelper 'test', ->
    "Hi there!"
  Handlebars.registerHelper 'temt', (options) ->
    options.fn @
