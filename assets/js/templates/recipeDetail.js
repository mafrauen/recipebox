function anonymous(locals, attrs, escape, rethrow, merge) {
var attrs = jade.attrs, escape = jade.escape, rethrow = jade.rethrow, merge = jade.merge;
var __jade = [{ lineno: 1, filename: "views/templates/recipeDetail.jade" }];
try {
var buf = [];
with (locals || {}) {
var interp;
__jade.unshift({ lineno: 1, filename: __jade[0].filename });
__jade.unshift({ lineno: 1, filename: __jade[0].filename });
buf.push('<h2>');
var __val__ = recipe.name
buf.push(escape(null == __val__ ? "" : __val__));
__jade.unshift({ lineno: undefined, filename: __jade[0].filename });
__jade.shift();
buf.push('</h2>');
__jade.shift();
__jade.unshift({ lineno: 2, filename: __jade[0].filename });
// iterate recipe.ingredients
;(function(){
  if ('number' == typeof recipe.ingredients.length) {
    for (var $index = 0, $$l = recipe.ingredients.length; $index < $$l; $index++) {
      var ingredient = recipe.ingredients[$index];

__jade.unshift({ lineno: 2, filename: __jade[0].filename });
__jade.unshift({ lineno: 3, filename: __jade[0].filename });
buf.push('<p>');
var __val__ = ingredient
buf.push(escape(null == __val__ ? "" : __val__));
__jade.unshift({ lineno: undefined, filename: __jade[0].filename });
__jade.shift();
buf.push('</p>');
__jade.shift();
__jade.shift();
    }
  } else {
    for (var $index in recipe.ingredients) {
      var ingredient = recipe.ingredients[$index];

__jade.unshift({ lineno: 2, filename: __jade[0].filename });
__jade.unshift({ lineno: 3, filename: __jade[0].filename });
buf.push('<p>');
var __val__ = ingredient
buf.push(escape(null == __val__ ? "" : __val__));
__jade.unshift({ lineno: undefined, filename: __jade[0].filename });
__jade.shift();
buf.push('</p>');
__jade.shift();
__jade.shift();
   }
  }
}).call(this);

__jade.shift();
__jade.shift();
}
return buf.join("");
} catch (err) {
  rethrow(err, __jade[0].filename, __jade[0].lineno);
}
}