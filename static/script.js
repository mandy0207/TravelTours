function validation() {

    var destination = document.getElementById("destination").value;
    var arrival = document.getElementById("arrival").value;


    console.log(destination);

    if (destination == "") {
        alert('please fill the destination');
        return false;
    }
}


function toggleHide() {
    let btn = document.getElementById('ccbtn');
    let interface = document.getElementById('payint');
    if (interface.style.display = "none")
        interface.style.display = "block";
    else
        interface.style.display = "none";
}