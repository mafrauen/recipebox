(function() {
  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
templates['header'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var foundHelper, self=this;


  return "<button id='newRecipe' class='btn btn-large'>New Recipe</button>\n\n<div class=\"input-append btn-group\">\n  <input id='recipeFilter' type=\"text\"><button class=\"btn search\" type='button'>Search</button><button class=\"btn clearSearch\" type='button'><i class='icon-remove' /></button><button class='btn dropdown-toggle' data-toggle='dropdown'><span class=\"caret\"></span></button>\n  <ul class=\"dropdown-menu\">\n    <li><label class=\"checkbox inline\"><input id='searchIngredients' type=\"checkbox\" checked>Search ingredients</label></li>\n  </ul>\n</div>\n";});
templates['ingredientForm'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, self=this, functionType="function", helperMissing=helpers.helperMissing, undef=void 0, escapeExpression=this.escapeExpression;


  buffer += "<label for=\"ingredient";
  foundHelper = helpers.index;
  stack1 = foundHelper || depth0.index;
  if(typeof stack1 === functionType) { stack1 = stack1.call(depth0, { hash: {} }); }
  else if(stack1=== undef) { stack1 = helperMissing.call(depth0, "index", { hash: {} }); }
  buffer += escapeExpression(stack1) + "\" class=\"control-label\">Ingredients</label>\n<div class=\"controls\">\n  <input id=\"ingredient";
  foundHelper = helpers.index;
  stack1 = foundHelper || depth0.index;
  if(typeof stack1 === functionType) { stack1 = stack1.call(depth0, { hash: {} }); }
  else if(stack1=== undef) { stack1 = helperMissing.call(depth0, "index", { hash: {} }); }
  buffer += escapeExpression(stack1) + "\" placeholder=\"Ingredient\" type=\"text\" class=\"input-xlarge ingredient\" value='";
  foundHelper = helpers.ingredient;
  stack1 = foundHelper || depth0.ingredient;
  if(typeof stack1 === functionType) { stack1 = stack1.call(depth0, { hash: {} }); }
  else if(stack1=== undef) { stack1 = helperMissing.call(depth0, "ingredient", { hash: {} }); }
  buffer += escapeExpression(stack1) + "'/>\n</div>\n";
  return buffer;});
templates['instructions'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var foundHelper, self=this;


  return "<h1>RecipeBox<br>\n  <small>Choose a recipe, or <span class='newRecipe'>create a new one!</span></small>\n</h1>\n";});
templates['recipeDetail'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, tmp1, self=this, functionType="function", helperMissing=helpers.helperMissing, undef=void 0, escapeExpression=this.escapeExpression, blockHelperMissing=helpers.blockHelperMissing;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n<p class=\"ingredient\">";
  stack1 = depth0;
  if(typeof stack1 === functionType) { stack1 = stack1.call(depth0, { hash: {} }); }
  else if(stack1=== undef) { stack1 = helperMissing.call(depth0, ".", { hash: {} }); }
  buffer += escapeExpression(stack1) + "</p>\n";
  return buffer;}

  buffer += "<div class=\"page-header\">\n  <h1>";
  foundHelper = helpers.name;
  stack1 = foundHelper || depth0.name;
  if(typeof stack1 === functionType) { stack1 = stack1.call(depth0, { hash: {} }); }
  else if(stack1=== undef) { stack1 = helperMissing.call(depth0, "name", { hash: {} }); }
  buffer += escapeExpression(stack1) + "</h1>\n</div>\n\n";
  foundHelper = helpers.ingredients;
  stack1 = foundHelper || depth0.ingredients;
  tmp1 = self.program(1, program1, data);
  tmp1.hash = {};
  tmp1.fn = tmp1;
  tmp1.inverse = self.noop;
  if(foundHelper && typeof stack1 === functionType) { stack1 = stack1.call(depth0, tmp1); }
  else { stack1 = blockHelperMissing.call(depth0, stack1, tmp1); }
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n";
  return buffer;});
templates['recipeForm'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, self=this, functionType="function", helperMissing=helpers.helperMissing, undef=void 0, escapeExpression=this.escapeExpression;


  buffer += "<form class=\"form-horizontal\">\n  <fieldset>\n    <legend>Edit Recipe:</legend>\n    <label for=\"name\" class=\"control-label\">Name:</label>\n    <div class=\"controls\">\n      <input id=\"name\" class='input-xlarge' type=\"text\" placeholder='Recipe Name' value='";
  foundHelper = helpers.name;
  stack1 = foundHelper || depth0.name;
  if(typeof stack1 === functionType) { stack1 = stack1.call(depth0, { hash: {} }); }
  else if(stack1=== undef) { stack1 = helperMissing.call(depth0, "name", { hash: {} }); }
  buffer += escapeExpression(stack1) + "' />\n    </div>\n    <ul id=\"newIngredients\" class='unstyled'></ul>\n    <div class=\"form-actions\">\n      <button type='button' id='save' class=\"btn btn-primary\">Save</button>\n      <button type='button' id='cancel' class=\"btn\">Cancel</button>\n    </div>\n  </fieldset>\n</form>\n";
  return buffer;});
templates['recipeView'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, self=this, functionType="function", helperMissing=helpers.helperMissing, undef=void 0, escapeExpression=this.escapeExpression;


  foundHelper = helpers.name;
  stack1 = foundHelper || depth0.name;
  if(typeof stack1 === functionType) { stack1 = stack1.call(depth0, { hash: {} }); }
  else if(stack1=== undef) { stack1 = helperMissing.call(depth0, "name", { hash: {} }); }
  buffer += escapeExpression(stack1) + "\n<i rel='tooltip' class='remove icon-remove'></i>\n";
  return buffer;});
})();