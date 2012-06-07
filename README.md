# Single User Recipe Box

## What
A simple CRUD app for recipes, like an online cookbook

## How
* Server
  * node.js [site][url_node]
  * express.js [site][url_express]
  * connect-assets [site][url_connect-assets]
  * jade templates [site][url_jade]
* Client
  * Backbone.js [site][url_backbone]
  * jQuery [site][url_jquery]
  * handlebar templates [site][url_handlebars]
  * HTML5 pushState
* Both
  * CoffeeScript [site][url_coffeescript]
* [Redis][url_redis] database with the following data structures:
  * Hash - to store a recipe and top level attributes (name, id, eventually rating, etc.)
  * Set - to store all recipe ids
  * List - to store ingredients for a single recipe
  * Value - to hold the next id for a new recipe

## Where
The project is hosted with [nodejitsu][url_nodejitsu] here:
[http://recipebox.jit.su][url_demo]

## Why
To learn more about Backbone and other client side technologies.


[url_node]: http://www.nodejs.org
[url_express]: http://www.expressjs.com
[url_connect-assets]: https://github.com/TrevorBurnham/connect-assets
[url_jade]: http://jade-lang.com/
[url_backbone]: http://www.backbonejs.org
[url_jquery]: http://www.jquery.com
[url_handlebars]: http://handlebarsjs.com/
[url_coffeescript]: http://www.coffeescript.org
[url_redis]: http://redis.io
[url_nodejitsu]: http://www.nodejitsu.com
[url_demo]: http://recipebox.jit.su
