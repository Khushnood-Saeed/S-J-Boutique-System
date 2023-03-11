function toggle() {
    var x = document.getElementById("pass");
    if (x.TextMode === "password") {
        x.TextMode = "text";
    } else {
        x.TextMode = "password";
    }
}

