/*
concat
reverse
join:
var array = ["hola", "mundo"];
var mensaje = array.join(""); // mensaje = "holamundo"
mensaje = array.join(" ");    // mensaje = "hola mundo"

push / pop
unshift / shift

sort:
var items = [
  { name: "Edward", value: 21 },
  { name: "Sharpe", value: 37 },
  { name: "And", value: 45 },
  { name: "The", value: -12 },
  { name: "Magnetic" },
  { name: "Zeros", value: 37 }
];
items.sort(function (a, b) {
    if (a.name > b.name)
      return 1;
    if (a.name < b.name)
      return -1;
    // a must be equal to b
    return 0;
});

*/

(function() {

  if (Array.prototype.find) {
    console.warn('Array.prototype.find has already been added.');
  }


  Array.prototype.shuffle = function ()
  {
    for(var j, x, i = this.length; i; j = Math.floor(Math.random() * i), x = this[--i], this[i] = this[j], this[j] = x);
  };

  Array.prototype.deleteAt = function (idx)
  {
    return this.splice(idx, 1);
  };

  Array.prototype.clone = function() {
    var clone = this.slice(0);
    return clone;
  };

  Array.prototype.clear = function() {
    return this.length = 0;
  };

  // borra datos repetidos
  Array.prototype.unique = function(a){
    return function(){return this.filter(a)}}(function(a,b,c){return c.indexOf(a,b+1)<0
  });

  /*
  String.prototype.capitaliseFirstLetter = function() {
    return this.charAt(0).toUpperCase() + this.slice(1);
  };

  String.prototype.toNumber = function() {
    return this - 0;
  };

  String.prototype.replaceAll = function(find, replace) {
    return this.replace(new RegExp(find, 'g'), replace);
  };

  String.prototype.replaceAllTypes = function(find, replace) {
    return this.replace(new RegExp(find, 'gi'), replace);
  };

  String.prototype.trim = function(){
    return this.replace(/^\s+|\s+$/g, '');
  };

  String.prototype.ltrim = function(){
    return this.replace(/^\s+/,'');
  };

  String.prototype.rtrim = function(){
    return this.replace(/\s+$/,'');
  };

  String.prototype.fulltrim = function(){
    return this.replace(/(?:(?:^|\n)\s+|\s+(?:$|\n))/g,'').replace(/\s+/g,' ');
  };

  String.prototype.removeTags = function() {
    var regex = /(<([^>]+)>)/ig
     return this.replace(regex, "");
  };
  */

  function toType(obj) {
    return ({}).toString.call(obj).match(/\s([a-z|A-Z]+)/)[1].toLowerCase();
  }

  Array.prototype.find = function(predicate) {
    if (this == null) {
      throw new TypeError('Array.prototype.find called on null or undefined');
    }
    if (typeof predicate !== 'function') {
      throw new TypeError('predicate must be a function');
    }
    var list = Object(this);
    var length = list.length >>> 0;
    var thisArg = arguments[1];
    var value;

    for (var i = 0; i < length; i++) {
      value = list[i];
      if (predicate.call(thisArg, value, i, list)) {
        return value;
      }
    }
    return undefined;
  };

})();