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

/* Firebase Database */

include("https://www.gstatic.com/firebasejs/8.2.9/firebase-app.js");
include("https://www.gstatic.com/firebasejs/8.2.9/firebase-analytics.js");
include("https://www.gstatic.com/firebasejs/8.2.9/firebase-auth.js");
include("https://www.gstatic.com/firebasejs/8.2.9/firebase-firestore.js");
/*
// Replace the following with your app's Firebase project configuration
// For Firebase JavaScript SDK v7.20.0 and later, `measurementId` is an optional field
var firebaseConfig = {
  apiKey: "API_KEY",
  authDomain: "PROJECT_ID.firebaseapp.com",
  databaseURL: "https://PROJECT_ID.firebaseio.com",
  projectId: "PROJECT_ID",
  storageBucket: "PROJECT_ID.appspot.com",
  messagingSenderId: "SENDER_ID",
  appId: "1:190805931323:web:f4086f461fdea54da6331e",
  //measurementId: "G-MEASUREMENT_ID",
};

// Initialize Firebase
firebase.initializeApp(firebaseConfig);*/