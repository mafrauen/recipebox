class HeaderView extends Backbone.View
  template: Handlebars.templates.header

  events:
    'click #newRecipe': 'newRecipe'
    'keyup #recipeFilter': 'filterKey'
    'click .dropdown-menu .checkbox': 'toggleFilterCheck'
    'click .clearSearch': 'clearSearch'

  render: =>
    @$el.html @template()
    @$('#recipeFilter').focus()
    @

  newRecipe: =>
    recipe = new Recipe
    @collection.add recipe
    recipe.trigger 'recipe:selected', recipe

  toggleFilterCheck: =>
    @filter()

  filterKey: (e) =>
    switch e.keyCode
      when 27 then @clearSearch()
      else @filter()

  filter: (e) =>
    console.log 'filter', e
    searchIngredients = @$('#searchIngredients').attr('checked')?
    text = @$('#recipeFilter').val()
    @collection.filterBy text, searchIngredients

    @$('.input-append.btn-group').toggleClass 'hasText', text.length > 0

  clearSearch: =>
    console.log 'clearing'
    @$('#recipeFilter').val ''
    @filter()

window.HeaderView = HeaderView
