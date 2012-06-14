class HeaderView extends Backbone.View
  template: Handlebars.templates.header

  events:
    'click #newRecipe': 'newRecipe'
    'keyup #recipeFilter': 'filter'
    'click .dropdown-menu .checkbox': 'toggleFilterCheck'

  render: =>
    @$el.html @template()
    @

  newRecipe: =>
    recipe = new Recipe
    @collection.add recipe
    recipe.trigger 'recipe:selected', recipe

  toggleFilterCheck: =>
    @filter()

  filter: =>
    searchIngredients = @$('#searchIngredients').attr('checked')?
    text = @$('#recipeFilter').val()
    @collection.filterBy text, searchIngredients

window.HeaderView = HeaderView
