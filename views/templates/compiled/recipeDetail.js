function anonymous(locals, attrs, escape, rethrow, merge) {
var attrs = jade.attrs, escape = jade.escape, rethrow = jade.rethrow, merge = jade.merge;
var buf = [];
with (locals || {}) {
var interp;
buf.push('<h2>');
var __val__ = recipe.name
buf.push(escape(null == __val__ ? "" : __val__));
buf.push('</h2>');
// iterate recipe.ingredients
;(function(){
  if ('number' == typeof recipe.ingredients.length) {
    for (var $index = 0, $$l = recipe.ingredients.length; $index < $$l; $index++) {
      var ingredient = recipe.ingredients[$index];

buf.push('<p>');
var __val__ = ingredient
buf.push(escape(null == __val__ ? "" : __val__));
buf.push('</p>');
    }
  } else {
    for (var $index in recipe.ingredients) {
      var ingredient = recipe.ingredients[$index];

buf.push('<p>');
var __val__ = ingredient
buf.push(escape(null == __val__ ? "" : __val__));
buf.push('</p>');
   }
  }
}).call(this);

}
return buf.join("");
}