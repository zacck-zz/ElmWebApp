'use strict';

require('./index.html')
//import elm
var Elm = require('./Main.elm');
//find div or element to attach to on DOM
var mountNode = document.getElementById('main');
//attach our app to the dom
var app = Elm.Main.embed(mountNode);
