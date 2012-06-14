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

  filterBy: (text, searchIngredients) =>
    exp = new RegExp text, 'i'
    @trigger 'recipes:filter', @filter (recipe) =>
      return true if exp.test(recipe.get 'name')
      if searchIngredients
        for ingredient in recipe.get 'ingredients'
          return true if exp.test ingredient


window.Recipe = Recipe
window.Cookbook = Cookbook
window.Ingredient = Ingredient
