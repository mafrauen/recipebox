function anonymous(locals, attrs, escape, rethrow, merge) {
var attrs = jade.attrs, escape = jade.escape, rethrow = jade.rethrow, merge = jade.merge;
var __jade = [{ lineno: 1, filename: "views/templates/recipeView.jade" }];
try {
var buf = [];
with (locals || {}) {
var interp;
__jade.unshift({ lineno: 1, filename: __jade[0].filename });
__jade.unshift({ lineno: 1, filename: __jade[0].filename });
buf.push('<p>');
var __val__ = recipe.name
buf.push(escape(null == __val__ ? "" : __val__));
__jade.unshift({ lineno: undefined, filename: __jade[0].filename });
__jade.shift();
buf.push('</p>');
__jade.shift();
__jade.shift();
}
return buf.join("");
} catch (err) {
  rethrow(err, __jade[0].filename, __jade[0].lineno);
}
}