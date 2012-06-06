class HeaderView extends Backbone.View
  events:
    'click button': 'newRecipe'

  render: =>
    @$el.html "<button id='newRecipe'>New Recipe</button>"
    @

  newRecipe: =>
    recipe = new Recipe
    @collection.add recipe
    recipe.trigger 'recipe:selected', recipe

window.HeaderView = HeaderView
