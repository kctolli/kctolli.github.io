/*Scripts*/

include("https://raw.githubusercontent.com/kctolli/scripting/main/javascript/ajax.js");
include("https://raw.githubusercontent.com/kctolli/scripting/main/javascript/time.js");
include("https://raw.githubusercontent.com/kctolli/scripting/main/javascript/form.js");
include("https://raw.githubusercontent.com/kctolli/scripting/main/javascript/appml.js");
include("https://raw.githubusercontent.com/kctolli/scripting/main/javascript/await.js");
include("https://raw.githubusercontent.com/kctolli/scripting/main/javascript/jQuery.js");
include("https://raw.githubusercontent.com/kctolli/scripting/main/javascript/cookie.js");
include("https://raw.githubusercontent.com/kctolli/scripting/main/javascript/screen.js");
include("https://raw.githubusercontent.com/kctolli/scripting/main/javascript/select.js");
include("https://raw.githubusercontent.com/kctolli/scripting/main/javascript/firebase.js");
include("https://raw.githubusercontent.com/kctolli/scripting/main/javascript/location.js");
include("https://raw.githubusercontent.com/kctolli/scripting/main/javascript/frameworks.js");

/*Basic Functions*/

function showhide(id) {
	var e = document.getElementById(id);
	e.style.display = (e.style.display == 'block') ? 'none' : 'block';
}

function darkmode() {
	var element = document.body;
 	element.classList.toggle("dark-mode");
}