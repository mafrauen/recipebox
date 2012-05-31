class HeaderView extends Backbone.View
  events:
    'click input': 'newRecipe'

  render: =>
    @$el.html "<input id='newRecipe' type='button' value='New Recipe'/>"
    @

  newRecipe: =>
    recipe = new Recipe
    @collection.add recipe
    recipe.trigger 'recipe:selected', recipe

window.HeaderView = HeaderView
