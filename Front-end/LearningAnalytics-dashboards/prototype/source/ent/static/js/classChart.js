var selectedSeat = null
var selectedStudent = null

window.onload = function()
{
    /*
        Ajax calls to get the correct information
    */
        drawVisual(-1,-1,-1);
}

function submit()
{
    var r = document.getElementById("ClassForm").elements[0].value;
    var c = document.getElementById("ClassForm").elements[1].value;
    var s = document.getElementById("ClassForm").elements[2].value;

    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "updateClass/"+r+"/"+c+"/"+s, true);
    xhttp.send();

    drawVisual(-1,-1,-1);
}

function graphClick(c, r, s)
{
    document.getElementById("seat_"+c+"_"+r+"_"+s).style.opacity = "0.5";
    if (selectedSeat != null)
        document.getElementById("seat_"+selectedSeat.c+"_"+selectedSeat.r+"_"+selectedSeat.s).style.opacity = "1";
    selectedSeat = {'c':c, 'r':r, 's':s};

    if (selectedStudent == null) return;

    assignSeat(selectedSeat , selectedStudent)
}

function studentClick(login)
{
    if (selectedStudent != null)
        document.getElementById("stud_"+selectedStudent).style.backgroundColor ="transparent";
    document.getElementById("stud_"+login).style.backgroundColor ="#CDB87D";

    selectedStudent = login

    if (selectedSeat == null) return;

    assignSeat(selectedSeat , selectedStudent)
}

function assignSeat(seat , student)
{
    document.getElementById("r_"+student).innerHTML = seat.r;
    document.getElementById("c_"+student).innerHTML = seat.c;
    document.getElementById("s_"+student).innerHTML = seat.s;

    document.getElementById("seat_"+seat.c+"_"+seat.r+"_"+seat.s).style.backgroundColor ="#0D2E97";
    document.getElementById("seat_"+seat.c+"_"+seat.r+"_"+seat.s).style.opacity = "1";
    document.getElementById("stud_"+student).style.backgroundColor ="transparent";

    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "updateSeat/"+student+"/"+seat.r+"/"+seat.c+"/"+seat.s, true);
    xhttp.send();

    /* Reset Values */
    selectedSeat = null
    selectedStudent = null

}