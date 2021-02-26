/*Scripts*/

include("./scripts/time.js");
include("./scripts/form.js");
include("./scripts/await.js");
include("./scripts/firebase.js");
include("./scripts/frameworks.js");
include("./scripts/geolocation.js");

/*Basic Functions*/

function showhide(id) {
	var e = document.getElementById(id);
	e.style.display = (e.style.display == 'block') ? 'none' : 'block';
}

function darkmode() {
	var element = document.body;
  element.classList.toggle("dark-mode");
}
