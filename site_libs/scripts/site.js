/*Scripts*/

include("./ajax.js");
include("./time.js");
include("./form.js");
include("./appml.js");
include("./await.js");
include("./jQuery.js");
include("./cookie.js");
include("./screen.js");
include("./select.js");
include("./firebase.js");
include("./location.js");
include("./frameworks.js");

/*Basic Functions*/

function showhide(id) {
	var e = document.getElementById(id);
	e.style.display = (e.style.display == 'block') ? 'none' : 'block';
}

function darkmode() {
	var element = document.body;
  	element.classList.toggle("dark-mode");
}