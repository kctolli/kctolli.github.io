include("https://www.w3schools.com/appml/2.0.3/appml.js");

function myController($appml) {
    if ($appml.message == "display") {
        if ($appml.display.name == "CustomerName") {
            $appml.display.value = $appml.display.value.toUpperCase();
        }
    }
}