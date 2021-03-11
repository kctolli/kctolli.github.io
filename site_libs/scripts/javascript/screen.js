/* Screen */

// Height
function height(id){document.getElementById(id).innerHTML = "Screen Height: " + screen.height;}

function availHeight(id){document.getElementById(id).innerHTML = "Available Screen Height: " + screen.availHeight;}

// Width

function width(id){document.getElementById(id).innerHTML = "Screen Height: " + screen.width;}

function availWidth(id){document.getElementById(id).innerHTML = "Available Screen Height: " + screen.availWidth;}

// Depth

function depth(id){document.getElementById("demo").innerHTML = "Screen Color Depth: " + screen.colorDepth;}

function pixeldepth(id){document.getElementById("demo").innerHTML = "Screen Pixel Depth: " + screen.pixelDepth;}

