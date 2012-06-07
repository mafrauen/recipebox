class Ingredient extends Backbone.Model
  defaults:
    name: ''

class Recipe extends Backbone.Model
  defaults:
    name: ''
    ingredients: []

class Cookbook extends Backbone.Collection
  model: Recipe
  url: '/api/recipes'


window.Recipe = Recipe
window.Cookbook = Cookbook
window.Ingredient = Ingredient
