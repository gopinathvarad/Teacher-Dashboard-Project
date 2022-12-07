document.getElementById("groupSelect").onchange = function()
{
    document.getElementById("labSelect").innerHTML = "<option value='N/A'>--Select Lab--</option>"

    if( document.getElementById("groupSelect").value != "N/A" )
    {
        document.getElementById('btnCreate').classList.add("disabled");

        var xhttp = new XMLHttpRequest();
        xhttp.open("GET", "getLabs/"+document.getElementById("groupSelect").value, false);
        xhttp.send();
        var labs = JSON.parse(xhttp.responseText);

        document.getElementById("labSelect").innerHTML = "<option value='N/A'>--Select Lab--</option>"
        for(var i = 0; i<labs.labs.length; i++)
        {
            document.getElementById("labSelect").innerHTML += "<option value="+ labs.labs[i].id +">"+labs.labs[i].display+"</option>"
        }
    }
    else document.getElementById('btnCreate').classList.add("disabled");
}


document.getElementById("labSelect").onchange = function()
{
    if( document.getElementById("labSelect").value != "N/A" )
    {
        document.getElementById('btnCreate').classList.remove("disabled");

    }
    else document.getElementById('btnCreate').classList.add("disabled");
}

document.getElementById('btnCreate').onclick = function()
{/* Checking remote mode takes you to class chart so you can assign seats */
    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "setMode/"+document.getElementById('customSwitch1').checked, true);
    xhttp.send();

    var url = "svc="+document.getElementById("labSelect").value+";group="+document.getElementById("groupSelect").value+"/";
    window.location.href = url;

}