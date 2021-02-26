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

function validateForm() {
  var x = document.forms["myForm"]["fname"].value;
  if (x == "") {
    alert("Name must be filled out");
    return false;
  }
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

/*Awaits*/

async function getText(file, id) {
  let myObject = await fetch(file);
  let myText = await myObject.text();
  document.getElementById(id).innerHTML = myText;
}

async function getFile(file, id) {
  let myPromise = new Promise(function(myResolve, myReject) {
    let req = new XMLHttpRequest();
    req.open('GET', file);
    req.onload = function() {
      if (req.status == 200) {
        myResolve(req.response);
      } else {
        myResolve("File not Found");
      }
    };
    req.send();
  });
  document.getElementById(id).innerHTML = await myPromise;
}

async function myDisplay(string, time, id) {
  let myPromise = new Promise(function(myResolve, myReject) {
    setTimeout(function() { myResolve(string); }, time);
  });
  document.getElementById(id).innerHTML = await myPromise;
}

/*Geolocation*/

/*
<button onclick="getLocation()">Try It</button>

<p id="loc"></p>
*/

var x = document.getElementById("loc");

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.watchPosition(showPosition);
  } else { 
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
  x.innerHTML = "Latitude: " + position.coords.latitude + 
  "<br>Longitude: " + position.coords.longitude;
}

function showError(error) {
  switch(error.code) {
    case error.PERMISSION_DENIED:
      x.innerHTML = "User denied the request for Geolocation."
      break;
    case error.POSITION_UNAVAILABLE:
      x.innerHTML = "Location information is unavailable."
      break;
    case error.TIMEOUT:
      x.innerHTML = "The request to get user location timed out."
      break;
    case error.UNKNOWN_ERROR:
      x.innerHTML = "An unknown error occurred."
      break;
  }
}

/* Timer */

/*
<div id="time"></div> - For myTimer (AM/PM)

<div onload="startTime()" id="txt"></div> - Start Timer (24hr)
*/

var timer = setInterval(myTimer, 100);

function myTimer() {
  var d = new Date();
  document.getElementById("time").innerHTML = d.toLocaleTimeString();
}

function startTime() {
  var today = new Date();
  var h = today.getHours();
  var m = today.getMinutes();
  var s = today.getSeconds();
  m = checkTime(m);
  s = checkTime(s);
  document.getElementById('txt').innerHTML =
  h + ":" + m + ":" + s;
  var t = setTimeout(startTime, 500);
}

function checkTime(i) {
  if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
  return i;
}