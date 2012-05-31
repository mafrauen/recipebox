tmpl = (id) ->
  jade.compile ($ id).text()

class CookbookView extends Backbone.View
  tagName: 'ul'

  initialize: ->
    @collection.bind 'add', @renderOne
    @collection.bind 'reset', @renderAll

  render: =>
    @$el.empty()
    @renderAll @collection
    @

  renderOne: (recipe) =>
    el = @newListView(recipe).render().el
    @$el.append el
    @scrollTo el

  scrollTo: (el) =>
    #http://stackoverflow.com/questions/2905867/how-to-scroll-to-specific-item-using-jquery
    @$el.scrollTop($(el).offset().top - @$el.offset().top + @$el.scrollTop())

  renderAll: (collection) =>
    @$el.append @newListView(recipe).render().el for recipe in collection.models

  newListView: (recipe) =>
    new RecipeListView model: recipe


class RecipeListView extends Backbone.View
  tagName: 'li'
  className: 'recipe'
  template: tmpl('#recipeView')

  events:
    'click': 'clicked'

  initialize: ->
    @model.bind 'change:name', @render
    @model.bind 'recipe:selected', @showActive
    @model.bind 'destroy', @remove

  render: =>
    el = @template(recipe: @model.toJSON())
    @$el.html el
    @

  clicked: =>
    @model.trigger 'recipe:selected', @model

  showActive:  =>
    $('.recipe.active').removeClass 'active'
    @$el.addClass 'active'


window.CookbookView = CookbookView
window.RecipeListView = RecipeListView
