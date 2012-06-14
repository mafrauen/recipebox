class CookbookView extends Backbone.View
  tagName: 'ul'
  className: 'nav nav-list'

  initialize: ->
    @collection.bind 'add', @renderOne
    @collection.bind 'reset', @renderAll
    @collection.bind 'destroy', @removeOne
    @views = []

  render: =>
    @$el.empty()
    @renderAll @collection
    @

  renderOne: (recipe) =>
    view = @newListView recipe
    el = view.render().el
    @$el.append el
    @scrollTo el
    view.showActive()

  scrollTo: (el) =>
    #http://stackoverflow.com/questions/2905867/how-to-scroll-to-specific-item-using-jquery
    @$el.scrollTop($(el).offset().top - @$el.offset().top + @$el.scrollTop())

  renderAll: (collection) =>
    @$el.append @newListView(recipe).render().el for recipe in collection.models

  newListView: (recipe) =>
    view = new RecipeListView model: recipe
    @views.push view
    return view

  removeOne: (recipe) =>
    view.remove() for view in @views when view.model is recipe


class RecipeListView extends Backbone.View
  tagName: 'li'
  className: 'recipe'
  template: Handlebars.templates.recipeView

  events:
    'click': 'clicked'

  initialize: =>
    @model.bind 'change:name', @render
    @model.bind 'recipe:selected', @showActive

  render: =>
    name = (@model.toJSON()).name
    name = 'New Recipe' unless name.length

    @$el.html @template
      name: name
    @$('.remove').tooltip title: 'Remove'
    @

  clicked: (e) =>
    if 'remove' in e.target.classList
      @clear()
    else
      @model.fetch()
      @model.trigger 'recipe:selected', @model

  showActive: =>
    $('.recipe.active').removeClass 'active'
    @$el.addClass 'active'

  clear: =>
    @$('.remove').tooltip 'hide'
    @model.destroy()


window.CookbookView = CookbookView
window.RecipeListView = RecipeListView
