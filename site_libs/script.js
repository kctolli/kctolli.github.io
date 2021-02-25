/*Include Frameworks*/

// React
include("https://unpkg.com/react@16/umd/react.production.min.js");
include("https://unpkg.com/react-dom@16/umd/react-dom.production.min.js");
include("https://unpkg.com/babel-standalone@6.15.0/babel.min.js");

// Angular
include("https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js");
include("https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js");
include("https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-animate.js");

// Vue 
include("https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js");
include("https://cdn.jsdelivr.net/npm/vue@2");

// Bootstrap
include("https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js");
include("https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js");
include("https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js");

// JQuery 
include("https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js");

// Appml 
include("https://www.w3schools.com/appml/2.0.3/appml.js");

// W3
include("https://www.w3schools.com/lib/w3.js");

/*Basic Functions*/

function showhide(id) {
	var e = document.getElementById(id);
	e.style.display = (e.style.display == 'block') ? 'none' : 'block';
}

function darkmode() {
	var element = document.body;
  element.classList.toggle("dark-mode");
}