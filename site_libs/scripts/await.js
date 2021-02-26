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
