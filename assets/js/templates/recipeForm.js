function anonymous(locals, attrs, escape, rethrow, merge) {
var attrs = jade.attrs, escape = jade.escape, rethrow = jade.rethrow, merge = jade.merge;
var __jade = [{ lineno: 1, filename: "views/templates/recipeForm.jade" }];
try {
var buf = [];
with (locals || {}) {
var interp;
__jade.unshift({ lineno: 1, filename: __jade[0].filename });
__jade.unshift({ lineno: 2, filename: __jade[0].filename });
buf.push('<input id="name" type="text" placeholder="Recipe Name"/>');
__jade.shift();
__jade.unshift({ lineno: 2, filename: __jade[0].filename });
buf.push('<ul id="newIngredients">');
__jade.unshift({ lineno: undefined, filename: __jade[0].filename });
__jade.shift();
buf.push('</ul>');
__jade.shift();
__jade.unshift({ lineno: 4, filename: __jade[0].filename });
buf.push('<input type="button" value="Save" id="save"/>');
__jade.shift();
__jade.shift();
}
return buf.join("");
} catch (err) {
  rethrow(err, __jade[0].filename, __jade[0].lineno);
}
}