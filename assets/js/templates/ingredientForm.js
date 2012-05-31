function anonymous(locals, attrs, escape, rethrow, merge) {
var attrs = jade.attrs, escape = jade.escape, rethrow = jade.rethrow, merge = jade.merge;
var __jade = [{ lineno: 1, filename: "views/templates/ingredientForm.jade" }];
try {
var buf = [];
with (locals || {}) {
var interp;
__jade.unshift({ lineno: 1, filename: __jade[0].filename });
__jade.unshift({ lineno: 1, filename: __jade[0].filename });
buf.push('<input type="text" placeholder="Ingredient" class="ingredient"/>');
__jade.shift();
__jade.shift();
}
return buf.join("");
} catch (err) {
  rethrow(err, __jade[0].filename, __jade[0].lineno);
}
}