class RecipeDetailView extends Backbone.View
  template: '<h1>Select a recipe from the left or create a new one!</h1>'

  initialize: ->
    @collection.on 'add', @form
    @collection.on 'recipe:selected sync', @show
    @collection.on 'destroy', @clear

  render: =>
    @visible = null
    @$el.html @template
    @

  show: (recipe) =>
    @visible = recipe
    @$el.html new ShowRecipeView(model: recipe).render().el if recipe.get 'id'

  form: (recipe) =>
    @visible = recipe
    @$el.html new NewRecipeView(model: recipe).render().el
    @$('#name').focus()

  clear: (recipe) =>
    @render() if recipe is @visible


class ShowRecipeView extends Backbone.View
  template: Handlebars.templates.recipeDetail

  initialize: ->
    @model.on 'change', @render

  render: =>
    @$el.html @template @model.toJSON()
    @


class RecipeFormView extends Backbone.View
  template: Handlebars.templates.recipeForm

  events:
    'click #save': 'save'
    'keyup .ingredient': 'ingredientType'
    'keyup #name': 'changeName'

  render: =>
    @$el.html @template @model.toJSON()
    @

  changeName: =>
    name = @$('#name').val().trim()
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
    ingredients = (@$(el).val().trim() for el in @$('#newIngredients .ingredient'))
    console.log ingredients

    hasBlank = '' in ingredients
    @addIngredient() unless hasBlank

  addIngredient: =>
    ingredient = new Ingredient()
    @$('#newIngredients').append new IngredientView(model: ingredient).render().el

  save: =>
    ingredients = (@$(el).val().trim() for el in @$('.ingredient') when @$(el).val().trim().length > 0)
    @model.save ingredients: ingredients


class NewRecipeView extends RecipeFormView
  render: =>
    super()
    @addIngredient()
    @

class IngredientView extends Backbone.View
  tagName: 'li'
  template: Handlebars.templates.ingredientForm

  render: =>
    @$el.html @template
      ingredient: @model.get 'name'
    @


window.RecipeDetailView = RecipeDetailView
