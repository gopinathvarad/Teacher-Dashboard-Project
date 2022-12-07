function ShowPopover(x, y)
{
    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "cellInfo/"+x+"/"+y, false);
    xhttp.send();
    var userInfo = JSON.parse(xhttp.responseText);

    var numCorrect = parseInt(document.getElementById('bar_row'+x+'_col'+y).getAttribute('correct'));
    var numAttempts = parseInt(document.getElementById('bar_row'+x+'_col'+y).getAttribute('count'));


    var bar = "";
    bar +='<div class="cell" style="border:solid 1px; width:100%; height:12px;">'
    var value;
    if (document.getElementById('bar_row'+x+'_col'+y).classList.contains("bg-success"))
    {
        value = "Success Rate: " + barSizeIfCorrect(numCorrect, numAttempts) + "%";
        bar += '<div class="progress-bar" role="progressbar" style="background-color:#CDB87D; height: 10px; width:'+barSizeIfCorrect(numCorrect, numAttempts)+'%"></div>'
    }
    else if (document.getElementById('bar_row'+x+'_col'+y).classList.contains("bg-danger"))
    {
        value = "Failed attempts: " + numAttempts

        bar += '<div class="progress-bar" role="progressbar" style="background-color:#CDB87D; height: 10px; width:'+barSizeIfWrong(numAttempts, parseInt(document.getElementById('actInfo'+x).getAttribute('maxAttempt')))+'%"></div>'
    }
    else
    {
        value = "Unattempted";
        bar += '<div class="progress-bar" role="progressbar" style="background-color:#CDB87D; height: 10px; width:0%"></div>'
    }
    bar += '</div>'


    var submissionsHistory = document.getElementById('bar_row'+x+'_col'+y).getAttribute('submissions').split(",")
    var histBars = "Subission History: <div>";
    for(var i=0; i<submissionsHistory.length; i++)
    {
        if(submissionsHistory[i] == "c")
        { /* Correct*/
            histBars += '<div class="rounded-circle mx-1 float-left bg-success" style="height: 10px; width:10px"></div>'
        }
        else if(submissionsHistory[i] == "w")
        { /* Wrong */
            histBars += '<div class="rounded-circle mx-1 float-left bg-danger"style="height: 10px; width:10px"></div>'
        }
    }
    histBars += "</div>"


    $('#row'+x+'_col'+y).popover({
        title: userInfo.user+'<br>'+userInfo.activity,
        content: value+"<br/>"+ bar + "<br/>"+histBars+"</br>",
        placement: 'right',
        html: true,
        container: 'body',
    }).popover('show');

    for(var i=0; i<userInfo.concepts.length; i++)
    {/*CONCEPTS*/
        document.getElementById('conceptTable'+userInfo.concepts[i].id).classList.remove("default_bar");
        document.getElementById('conceptTable'+userInfo.concepts[i].id).classList.add("show_bar");
    }

    for (var i=0; i<userInfo.estimations.length; i++)
    { /* Estimated knowledge of student */
        document.getElementById('concept_bar'+userInfo.estimations[i].id).style.height = userInfo.estimations[i].estimation*100 + "%";
    }


    /*COL*/
    for (var i=0; i<activity.length; i++)
    {
        document.getElementById('row'+activity[i].id+'_col'+y).classList.remove("default_bar");
        document.getElementById('row'+activity[i].id+'_col'+y).classList.add("show_bar");
    }

    document.getElementById('col'+y).classList.remove("default_bar");
    document.getElementById('col'+y).classList.add("show_bar");

    /*ROW*/
    for (var i=0; i<student.length; i++)
    {
        document.getElementById('row'+x+'_col'+student[i].login).classList.remove("default_bar");
        document.getElementById('row'+x+'_col'+student[i].login).classList.add("show_bar");
    }
    document.getElementById('average_student'+x).classList.remove("default_bar");
    document.getElementById('average_student'+x).classList.add("show_bar");

    document.getElementById('row'+x).classList.remove("default_bar");
    document.getElementById('row'+x).classList.add("show_bar");
}

function HidePopover(x, y)
{
    $('#row'+x+'_col'+y).popover('dispose');
    /*CONCEPTS*/
    for(var i=0; i<concept.length; i++)
    {
        document.getElementById('concept_bar'+concept[i].id).style.height = concept[i].estimation*100+"%"
        document.getElementById('conceptTable'+concept[i].id).classList.remove("show_bar");
        document.getElementById('conceptTable'+concept[i].id).classList.add("default_bar");
    }

    /*COL*/
    for (var i=0; i<activity.length; i++)
    {
        document.getElementById('row'+activity[i].id+'_col'+y).classList.remove("show_bar");
        document.getElementById('row'+activity[i].id+'_col'+y).classList.add("default_bar");
    }

    document.getElementById('col'+y).classList.remove("show_bar");
    document.getElementById('col'+y).classList.add("default_bar");

    /*ROW*/
    for (var i=0; i<student.length; i++)
    {
        document.getElementById('row'+x+'_col'+student[i].login).classList.remove("show_bar");
        document.getElementById('row'+x+'_col'+student[i].login).classList.add("default_bar");
    }
    document.getElementById('average_student'+x).classList.remove("show_bar");
    document.getElementById('average_student'+x).classList.add("default_bar");

    document.getElementById('row'+x).classList.remove("show_bar");
    document.getElementById('row'+x).classList.add("default_bar");
}

function ShowActivityPopover(x)
{
    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "activityInfo/"+x, false);
    xhttp.send();
    var activityInfo = JSON.parse(xhttp.responseText);

    var infoAgg = parseInt(document.getElementById('actInfo'+x).getAttribute('maxAttempt'));

    var infoRightCount = parseInt(document.getElementById('average_student'+x+'_success').getAttribute('count'));
    var infoWrongCount = parseInt(document.getElementById('average_student'+x+'_fail').getAttribute('count'));
    var infoRightSubs = parseInt(document.getElementById('average_student'+x+'_success').getAttribute('submissions'));
    var infoWrongSubs = parseInt(document.getElementById('average_student'+x+'_fail').getAttribute('submissions'));

    var top = (infoWrongCount==0) ? 0 : Math.floor(infoWrongSubs/infoWrongCount);
    var barFail = "Incorrect: "+ top+" attempts<br/>";
    barFail +='<div class="cell" style="border:solid 1px; width:100%; height:12px;">'
    barFail += '<div class="progress-bar bg-danger" role="progressbar" style="width: '+ barSizeIfWrong( top, infoAgg )+'%; height:10px"></div>'
    barFail += '</div>'

    var barRight = "Correct: "+barSizeIfCorrect(infoRightSubs , infoRightCount)+"%<br/>";
    barRight +='<div class="cell" style="border:solid 1px; width:100%; height:12px;">'
    barRight += '<div class="progress-bar bg-success" role="progressbar" style="width: '+barSizeIfCorrect(infoRightSubs , infoRightCount)+'%; height:10px"></div>'
    barRight += '</div>'


    $('#row'+x).popover({
        title: activityInfo.display,
        content: barRight + "<br/>" + barFail,
        placement: 'bottom',
        html: true,
        container: 'body',
    }).popover('show');

    for(var i=0; i<activityInfo.concepts.length; i++)
    {
        document.getElementById('conceptTable'+activityInfo.concepts[i].id).classList.remove("default_bar");
        document.getElementById('conceptTable'+activityInfo.concepts[i].id).classList.add("show_bar");
    }


    for (var i=0; i<student.length; i++)
    {
        document.getElementById('row'+x+'_col'+student[i].login).classList.remove("default_bar");
        document.getElementById('row'+x+'_col'+student[i].login).classList.add("show_bar");
    }

    document.getElementById('average_student'+x).classList.remove("default_bar");
    document.getElementById('average_student'+x).classList.add("show_bar");

    document.getElementById('row'+x).classList.remove("default_bar");
    document.getElementById('row'+x).classList.add("show_bar");
}

function HideActivityPopover(x)
{
    $('#row'+x).popover('dispose');

    for(var i=0; i<concept.length; i++)
    {
        document.getElementById('conceptTable'+concept[i].id).classList.remove("show_bar");
        document.getElementById('conceptTable'+concept[i].id).classList.add("default_bar");
    }

    for (var i=0; i<student.length; i++)
    {
        document.getElementById('row'+x+'_col'+student[i].login).classList.remove("show_bar");
        document.getElementById('row'+x+'_col'+student[i].login).classList.add("default_bar");
    }

    document.getElementById('average_student'+x).classList.remove("show_bar");
    document.getElementById('average_student'+x).classList.add("default_bar");

    document.getElementById('row'+x).classList.remove("show_bar");
    document.getElementById('row'+x).classList.add("default_bar");
}

function ShowUserPopover(x)
{
    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "userInfo/"+x, false);
    xhttp.send();
    var userInfo = JSON.parse(xhttp.responseText);

    var attempted = 0;
    var correct = 0;


    var studentAttribute = document.getElementById("col"+x)
    var studentAttempted = parseInt(studentAttribute.getAttribute('attempted'));
    var studentCorrect = parseInt(studentAttribute.getAttribute('correct'));

    var response = (studentAttempted == 0) ? 0 : Math.floor(studentCorrect/studentAttempted*100);
    var currentScore = "Score on attempted: " + response + "%";

    var scoreBar = currentScore+"<br/>";
    scoreBar +='<div class="cell" style="border:solid 1px; width:100%; height:12px;">'
    scoreBar += '<div class="progress-bar" role="progressbar" style="background-color:#CDB87D; width: '+response+'%; height:10px"></div>'
    scoreBar += '</div>'

    var compBar = "Score on lab: "+Math.floor(studentCorrect/activity.length*100)+"%<br/>";
    compBar +='<div class="cell" style="border:solid 1px; width:100%; height:12px;">'
    compBar += '<div class="progress-bar" role="progressbar" style="background-color:#CDB87D; width: '+Math.floor(studentCorrect/activity.length*100)+'%; height:10px"></div>'
    compBar += '</div>'

    $('#col'+x).popover({
        title: userInfo.name,
        content: scoreBar+"<br/>"+compBar,
        html: true,
        container: 'body',
        placement: 'right',
    }).popover('show');


    for (var i=0; i<userInfo.estimations.length; i++)
    { /* Estimated knowledge of student */
        document.getElementById('concept_bar'+userInfo.estimations[i].id).style.height = userInfo.estimations[i].estimation*100 + "%";
    }

    for (var i=0; i<activity.length; i++)
    { /* Go down the column */
        document.getElementById('row'+activity[i].id+'_col'+x).classList.remove("default_bar");
        document.getElementById('row'+activity[i].id+'_col'+x).classList.add("show_bar");
    }

    document.getElementById('col'+x).classList.remove("default_bar");
    document.getElementById('col'+x).classList.add("show_bar");
}

function HideUserPopover(x)
{
    $('#col'+x).popover('dispose');

    for (var i=0; i<activity.length; i++)
    { /* Go down the column */
        document.getElementById('row'+activity[i].id+'_col'+x).classList.remove("show_bar");
        document.getElementById('row'+activity[i].id+'_col'+x).classList.add("default_bar");
    }

    for (var i=0; i<concept.length; i++)
    { /* Reset Concepts */
        document.getElementById('concept_bar'+concept[i].id).style.height = concept[i].estimation*100+"%"
    }

    document.getElementById('col'+x).classList.remove("show_bar");
    document.getElementById('col'+x).classList.add("default_bar");
}

function ShowConceptHover(x)
{
    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "conceptInfo/"+x, false);
    xhttp.send();
    var conceptInfo = JSON.parse(xhttp.responseText);

    document.getElementById('conceptTable'+x).classList.remove("default_bar");
    document.getElementById('conceptTable'+x).classList.add("show_bar");

    document.getElementById('conceptTitle').innerHTML = Math.floor(parseInt(document.getElementById('concept_bar'+x).style.height)) +"% - "+ conceptInfo.title;
}

function HideConceptHover(x)
{
    document.getElementById('conceptTable'+x).classList.remove("show_bar");
    document.getElementById('conceptTable'+x).classList.add("default_bar");

    document.getElementById('conceptTitle').innerHTML = "Concepts";
}