class RecipeDetailView extends Backbone.View
  template: '<h1>Select a recipe from the left or create a new one!</h1>'

  initialize: ->
    @collection.on 'add', @form
    @collection.on 'recipe:selected sync', @show

  render: =>
    @$el.html @template
    @

  show: (recipe) =>
    @$el.html new ShowRecipeView(model: recipe).render().el if recipe.get 'id'

  form: (recipe) =>
    @$el.html new NewRecipeView(model: recipe).render().el
    @$('#name').focus()


class ShowRecipeView extends Backbone.View
  template: Handlebars.templates.recipeDetail

  initialize: ->
    @model.on 'change', @render

  render: =>
    @$el.html @template @model.toJSON()
    @


class NewRecipeView extends Backbone.View
  template: Handlebars.templates.recipeForm

  events:
    'click #save': 'save'
    'keyup .ingredient': 'ingredientType'
    'keyup #name': 'changeName'

  render: =>
    @$el.html @template @model.toJSON()
    @addIngredient()
    @

  changeName: =>
    name = @$('#name').val().trim()
    name = @model.defaults.name unless name.length
    @model.set name: name

  ingredientType: (e) =>
    enter = 13; backspace = 8; tab = 9
    switch e.keyCode
      when enter then @save()
      when backspace, tab # then do nothing
      else @cleanIngredients()

  cleanIngredients: =>
    @removeInvalidBlankIngredients()
    @makeBlankIngredintAvailable()

  removeInvalidBlankIngredients: =>
    @$('#newIngredients .ingredient:not(:last)').filter(':text[value=""]').parent().remove()

  makeBlankIngredintAvailable: =>
    ingredients = (el.value.trim() for el in @$('#newIngredients .ingredient'))
    hasBlank = '' in ingredients
    @addIngredient() unless hasBlank

  addIngredient: =>
    @$('#newIngredients').append new IngredientView(model: @model).render().el

  save: =>
    ingredients = (el.value.trim() for el in @$('.ingredient') when el.value.trim().length > 0)
    @model.save ingredients: ingredients


class IngredientView extends Backbone.View
  tagName: 'li'
  template: Handlebars.templates.ingredientForm

  render: =>
    @$el.html @template @model.toJSON()
    @


window.RecipeDetailView = RecipeDetailView
