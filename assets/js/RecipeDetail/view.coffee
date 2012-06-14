class RecipeDetailView extends Backbone.View
  className: 'hero-unit'
  template: Handlebars.templates.instructions

  events:
    'click .newRecipe': 'addNew'

  initialize: ->
    @collection.on 'add', @newRecipe
    @collection.on 'recipe:selected sync', @show
    @collection.on 'recipe:discard', @show
    @collection.on 'destroy', @clear
    @collection.on 'recipe:edit', @edit

  render: =>
    @visible = null
    @$el.html @template()
    @

  show: (recipe) =>
    @visible = recipe
    @$el.html new ShowRecipeView(model: recipe).render().el if recipe.get 'id'

  addNew: =>
    @collection.add new Recipe

  newRecipe: (recipe) =>
    @visible = recipe
    @$el.html new NewRecipeView(model: recipe).render().el
    @$('#name').focus()

  edit: (recipe) =>
    @visible = recipe
    @$el.html new EditRecipeView(model: recipe).render().el
    @$('#name').focus()

  clear: (recipe) =>
    @render() if recipe is @visible


class ShowRecipeView extends Backbone.View
  template: Handlebars.templates.recipeDetail

  events:
    'dblclick': 'edit'

  initialize: ->
    @model.on 'change', @render

  render: =>
    @$el.html @template @model.toJSON()
    @

  edit: =>
    @model.trigger 'recipe:edit', @model


class RecipeFormView extends Backbone.View
  keys:
    backspace: 8
    tab: 9
    enter: 13
    esc: 27

  template: Handlebars.templates.recipeForm

  events:
    'click #save': 'save'
    'click #cancel': 'cancel'
    'keyup .ingredient': 'ingredientType'
    'keyup #name': 'changeName'

  render: =>
    $('body').keyup (e) =>
      @cancel() if e.keyCode is @keys.esc
    @$el.html @template @model.toJSON()
    @

  changeName: =>
    name = @$('#name').val().trim()
    @model.set name: name

  ingredientType: (e) =>
    switch e.keyCode
      when @keys.enter then @save()
      when @keys.backspace, @keys.tab # then do nothing
      else @cleanIngredients()

  cleanIngredients: =>
    @removeInvalidBlankIngredients()
    @makeBlankIngredintAvailable()

  removeInvalidBlankIngredients: =>
    @$('#newIngredients .ingredient:not(:last)').filter(':text[value=""]').parent().remove()

  makeBlankIngredintAvailable: =>
    ingredients = (@$(el).val().trim() for el in @$('#newIngredients .ingredient'))

    hasBlank = '' in ingredients
    @addIngredient() unless hasBlank

  addIngredient: (ingredient) =>
    ingredient = ingredient || new Ingredient()
    @$('#newIngredients').append new IngredientView(model: ingredient).render().el

  save: =>
    ingredients = (@$(el).val().trim() for el in @$('.ingredient') when @$(el).val().trim().length > 0)
    @model.save ingredients: ingredients

  cancel: =>
    if @model.isNew()
      @model.destroy()
    else
      @model.trigger 'recipe:discard', @model

class NewRecipeView extends RecipeFormView
  render: =>
    super()
    @addIngredient()
    @

class EditRecipeView extends RecipeFormView
  render: =>
    super()
    @addIngredient new Ingredient name: ingredient for ingredient in @model.get 'ingredients'
    @addIngredient() # make sure there is a blank available
    @

class IngredientView extends Backbone.View
  tagName: 'li'
  template: Handlebars.templates.ingredientForm

  render: =>
    @$el.html @template
      ingredient: @model.get 'name'
    @


window.RecipeDetailView = RecipeDetailView
