/*Scripts*/

include("./javascript/ajax.js");
include("./javascript/time.js");
include("./javascript/form.js");
include("./javascript/appml.js");
include("./javascript/await.js");
include("./javascript/jQuery.js");
include("./javascript/cookie.js");
include("./javascript/screen.js");
include("./javascript/select.js");
include("./javascript/firebase.js");
include("./javascript/location.js");
include("./javascript/frameworks.js");

/*Basic Functions*/

function showhide(id) {
	var e = document.getElementById(id);
	e.style.display = (e.style.display == 'block') ? 'none' : 'block';
}

function darkmode() {
	var element = document.body;
  element.classList.toggle("dark-mode");
}