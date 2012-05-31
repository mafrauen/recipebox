function anonymous(locals, attrs, escape, rethrow, merge) {
var attrs = jade.attrs, escape = jade.escape, rethrow = jade.rethrow, merge = jade.merge;
var buf = [];
with (locals || {}) {
var interp;
buf.push('<input id="name" type="text" placeholder="Recipe Name"/><ul id="newIngredients"></ul><input type="button" value="Save" id="save"/>');
}
return buf.join("");
}