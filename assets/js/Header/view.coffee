class HeaderView extends Backbone.View
  tagName: 'button'
  id: 'newRecipe'
  className: 'btn btn-large'

  events:
    'click': 'newRecipe'

  render: =>
    @$el.html 'New Recipe'
    @

  newRecipe: =>
    recipe = new Recipe
    @collection.add recipe
    recipe.trigger 'recipe:selected', recipe

window.HeaderView = HeaderView
