function drawVisual(x,y,z)
{
    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "/ent/getMode", false);
    xhttp.send();
    var mode = JSON.parse(xhttp.responseText);

    if (mode.mode == "true")
    {/* Remote Mode is on - show message */
        var text = ""
        text += "<strong>Remote mode is turned on!</strong>"
        text += "<small >To change, go back to main menu and turn remote mode off</small>"

        document.getElementById("class_map").innerHTML = text;
    }
    else
    { /* Remote Mode is off - draw */
        var xhttp = new XMLHttpRequest();
        xhttp.open("GET", "/ent/getClass", false);
        xhttp.send();
        var dimensions = JSON.parse(xhttp.responseText);

        var chart = "";
        for (c=0; c < dimensions.c; c++)
        {
            chart += "<div class='col'>"
            for (r=0; r < dimensions.r; r++)
            {
                chart += "<div class='row mx-2'>"
                for (s=0; s < dimensions.s; s++)
                {
                    if(c==x && r==y && s==z)
                        chart += "<div class='col border m-2' style='height:25px; background-color: #0D2E97;'></div>"
                    else
                        chart += "<div id='seat_"+c+"_"+r+"_"+s+"' class='col border m-2' onclick='graphClick("+c+","+r+","+s+")' style='height:25px; background-color: #CDB87D;'></div>"
                }
                chart += "</div>"
            }
            chart += "</div>"
        }
        document.getElementById("class_map").innerHTML = chart
    }
}