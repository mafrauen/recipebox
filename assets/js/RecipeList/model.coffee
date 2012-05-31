class Recipe extends Backbone.Model
  defaults:
    name: 'New Recipe'
    ingredients: []


class Cookbook extends Backbone.Collection
  model: Recipe
  url: '/api/recipes'


window.Recipe = Recipe
window.Cookbook = Cookbook
