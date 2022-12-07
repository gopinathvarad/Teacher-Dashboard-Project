var timer = 30 * 1000; //seconds * milli = milli seconds

var current_submission = []
var notifications = []

var student = []
var activity = []
var concept = []

window.setInterval( updateDashboard, timer)

window.onload = function()
{ /* Retrieve the neccecary tables */
    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "getTables", false);
    xhttp.send();
    var tables = JSON.parse(xhttp.responseText);

    student = tables.students
    activity = tables.activities
    concept = tables.concepts

    updateDashboard();
}

function updateDashboard()
{ /* Periodically request the information*/
    updateTimer()

    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "update", false);
    xhttp.send();
    var update_info = JSON.parse(xhttp.responseText);

    for (var i=current_submission.length; i< update_info.info.length; i++)
    { /* loop over all activities, but start at the newest one */
        var thisBar = document.getElementById('bar_row'+update_info.info[i].activity+'_col'+update_info.info[i].student)
        var aggSucc = document.getElementById('average_student'+update_info.info[i].activity+'_success')
        var aggFail = document.getElementById('average_student'+update_info.info[i].activity+'_fail')
        var studentAttribute = document.getElementById("col"+update_info.info[i].student)
        var maxAtt = document.getElementById('actInfo'+update_info.info[i].activity);

        var totCount = parseInt(thisBar.getAttribute('count'));
        var totCorrect = parseInt(thisBar.getAttribute('correct'));


        var color = "bg-dark";

        if (update_info.info[i].result == 1 || update_info.info[i].result == 1.0 )
        { /* Got assignment correct */
            thisBar.setAttribute('submissions', thisBar.getAttribute('submissions')+"c,");
            aggSucc.setAttribute('submissions', parseInt(aggSucc.getAttribute('submissions'))+1); //number of correct submissions

            totCount++;
            totCorrect++;

            if (thisBar.classList.contains("bg-dark"))
            { /* First time attempting assignment*/
                aggSucc.setAttribute('count', parseInt(aggSucc.getAttribute('count'))+1);

                studentAttribute.setAttribute('attempted', parseInt(studentAttribute.getAttribute('attempted'))+1);
                studentAttribute.setAttribute('correct', parseInt(studentAttribute.getAttribute('correct'))+1);

                thisBar.classList.remove("bg-dark")
                thisBar.classList.add("bg-success")
            }
            else if (thisBar.classList.contains("bg-danger"))
            { /* Got an attempt prior wrong */
                aggSucc.setAttribute('count', parseInt(aggSucc.getAttribute('count')) + parseInt(thisBar.getAttribute('count')));
                aggFail.setAttribute('submissions', parseInt(aggFail.getAttribute('submissions')) - parseInt(thisBar.getAttribute('count')));
                aggFail.setAttribute('count', parseInt(aggFail.getAttribute('count'))-1);

                studentAttribute.setAttribute('correct', parseInt(studentAttribute.getAttribute('correct'))+1);

                thisBar.classList.remove("bg-danger")
                thisBar.classList.add("bg-success")
            }
            else if (thisBar.classList.contains("bg-success"))
            { /* Got the assignment correct again */
                aggSucc.setAttribute('count', parseInt(aggSucc.getAttribute('count'))+1);
            }
            thisBar.style.width = barSizeIfCorrect(totCorrect, totCount) + "%";
        }
        else if (update_info.info[i].result == 0 || update_info.info[i].result == 0.0 )
        { /* Got the problem wrong */
            thisBar.setAttribute('submissions', thisBar.getAttribute('submissions')+"w,");
            totCount++;
            if(totCount > parseInt(maxAtt.getAttribute('maxAttempt')) )
                maxAtt.setAttribute('maxAttempt', totCount )

            if (thisBar.classList.contains("bg-dark"))
            { /* First attempt on problem*/
                studentAttribute.setAttribute('attempted', parseInt(studentAttribute.getAttribute('attempted'))+1);

                aggFail.setAttribute('submissions', parseInt(aggFail.getAttribute('submissions'))+1);
                aggFail.setAttribute('count', parseInt(aggFail.getAttribute('count'))+1);

                thisBar.classList.remove("bg-dark")
                thisBar.classList.add("bg-danger")

                thisBar.style.width = barSizeIfWrong( totCount, parseInt(maxAtt.getAttribute('maxAttempt')) ) + "%";
            }
            else if (thisBar.classList.contains("bg-danger"))
            { /* wrong before, wrong now */
                aggFail.setAttribute('submissions', parseInt(aggFail.getAttribute('submissions'))+1);
                thisBar.style.width = barSizeIfWrong(totCount, parseInt(maxAtt.getAttribute('maxAttempt'))) + "%";
            }
            else if (thisBar.classList.contains("bg-success"))
            { /* got it right before, but wrong now */
                aggSucc.setAttribute('count', parseInt(aggSucc.getAttribute('count'))+1);
                thisBar.style.width = barSizeIfCorrect(totCorrect, totCount) + "%";
            }
        }

        aggSucc.style.width = barSizeIfCorrect( parseInt(aggSucc.getAttribute('submissions')), parseInt(aggSucc.getAttribute('count')) ) + "%"; //avg student correct / tot subs
        var top = (parseInt(aggFail.getAttribute('count'))==0) ? 0 : Math.floor(parseInt(aggFail.getAttribute('submissions'))/parseInt(aggFail.getAttribute('count')));
        aggFail.style.width = barSizeIfWrong( top , parseInt(maxAtt.getAttribute('maxAttempt')) ) + "%"; //avg attempts / max attempt

        thisBar.setAttribute('count', totCount);
        thisBar.setAttribute('correct', totCorrect);

        if (thisBar.classList.contains("bg-danger") && parseInt(thisBar.getAttribute('count')) >= 5)
        { /* Check if they are at-risk */
            createToast(update_info.info[i].student, update_info.info[i].activity)
        }

        current_submission.push(update_info.info) //add this assignment to the list of all done
        updateConceptBar()
    }
}

function updateTimer()
{
    for(var i=0; i<notifications.length; i++)
        document.getElementById(notifications[i]+"_Timer").innerHTML = parseInt(document.getElementById(notifications[i]+"_Timer").innerHTML)+timer/1000;
}

function createToast(detected_student, detected_activity)
{
    let id = detected_student+"_"+detected_activity;
    if (notifications.includes(id)) return; //Already exists
    var sRow;
    var sCol;
    var sSeat;
    for (var i=0; i<student.length; i++)
    {
        if(student[i].login == detected_student)
        {
            sRow = student[i].row;
            sCol = student[i].col;
            sSeat = student[i].seat;
            break;
        }
    }

    var curr_value = document.getElementById('notification_number').textContent;
    curr_value = parseInt(curr_value)
    curr_value++;
    document.getElementById('notification_number').innerHTML = curr_value;

    let html = `<div role="alert" newAlert="true" aria-live="assertive" aria-atomic="true" class="toast" data-autohide="false" id=${id}>
                    <a onclick="ModalFill(${sCol},${sRow},${sSeat}, ${id})" data-toggle="modal" data-target="#AlertModal">
                        <div class="toast-header">
                            <span id="${id}_Icon">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-exclamation-diamond-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M9.05.435c-.58-.58-1.52-.58-2.1 0L.436 6.95c-.58.58-.58 1.519 0 2.098l6.516 6.516c.58.58 1.519.58 2.098 0l6.516-6.516c.58-.58.58-1.519 0-2.098L9.05.435zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                                </svg>
                            </span>
                            <small><span id="${id}_Timer">0</span>s ago</small>
                        </div>
                        <div class="toast-body">
                            <strong class="mr-auto">At-Risk Student</strong>
                            <br/>
                            <small>Click to check it out</small>
                        </div>
                    </a>
                </div>`;

    document.getElementById('toast_notifications_body').innerHTML += html;
    $('.toast').toast('show');
    notifications.push(id)
}

function ModalFill(x,y,z, id)
{
    if (document.getElementById(id.id).getAttribute('newAlert') == "true")
    {
        document.getElementById(id.id+"_Icon").innerHTML = `
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-exclamation-diamond" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" d="M6.95.435c.58-.58 1.52-.58 2.1 0l6.515 6.516c.58.58.58 1.519 0 2.098L9.05 15.565c-.58.58-1.519.58-2.098 0L.435 9.05a1.482 1.482 0 0 1 0-2.098L6.95.435zm1.4.7a.495.495 0 0 0-.7 0L1.134 7.65a.495.495 0 0 0 0 .7l6.516 6.516a.495.495 0 0 0 .7 0l6.516-6.516a.495.495 0 0 0 0-.7L8.35 1.134z"/>
              <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
            </svg>`;



        document.getElementById(id.id).setAttribute('newAlert', "false");

        var curr_value = document.getElementById('notification_number').textContent;
        curr_value = parseInt(curr_value)
        curr_value--;
        document.getElementById('notification_number').innerHTML = curr_value;
    }

    var splittedID = id.id.split("_")

    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "modalInfo/"+splittedID[1]+"/"+splittedID[0], false);
    xhttp.send();
    var userInfo = JSON.parse(xhttp.responseText);
    var studentName = userInfo.user;
    var activityName = userInfo.activity;
    var conceptsUsed = userInfo.concepts;
    var sec = parseInt(document.getElementById(id.id+"_Timer").innerHTML)

    var maxAttempt = parseInt(document.getElementById('actInfo'+splittedID[1]).getAttribute('maxAttempt'));
    var numSubs = parseInt(document.getElementById('bar_row'+splittedID[1]+'_col'+splittedID[0]).getAttribute('count'));
    var subBar = '<div class="progress-bar" style="background-color:#0D2E97; height: 15px; width:'+barSizeIfWrong(numSubs, maxAttempt)+'%; margin-top:5px;"></div>';

    var inputText = "<div class='row'><h2>General Information</h2></div>";
    inputText += "<div class='row'>"
        inputText += "<div class='col-sm-6'><b>Elapsed time since notified:</b></div>"
        inputText += "<div class='col-sm-1'>-</div>"
        inputText += "<div class='col-sm-5'><i> "+ Math.floor(sec/60)+"m "+Math.floor(sec%60) +"s</i></div>"
    inputText += "</div>"
    inputText += "<div class='row'>"
        inputText += "<div class='col-sm-6'><b>Student Name:</b></div>"
        inputText += "<div class='col-sm-1'>-</div>"
        inputText += "<div class='col-sm-5'><i> "+ studentName +"</i></div>"
    inputText += "</div>"
    inputText += "<div class='row'>"
        inputText += "<div class='col-sm-6'><b>Activity:</b></div>"
        inputText += "<div class='col-sm-1'>-</div>"
        inputText += "<div class='col-sm-5'><i> "+ activityName +"</i></div>"
    inputText += "</div>"
    inputText += "<div class='row'>"
        inputText += "<div class='col-sm-6'><b>Time spent on Activity:</b></div>"
        inputText += "<div class='col-sm-1'>-</div>"
        inputText += "<div class='col-sm-5'><i> "+ Math.floor(userInfo.time/60)+"m "+Math.floor(userInfo.time%60) +"s</i></div>"
    inputText += "</div>"
    inputText += "<div class='row'>"
        inputText += "<div class='col-sm-6'><b>Number of submissions:</b></div>"
        inputText += "<div class='col-sm-1'>"+document.getElementById('bar_row'+splittedID[1]+'_col'+splittedID[0]).getAttribute('count')+"</div>"
        inputText += "<div class='col-sm-5'>"+ subBar +"</div>"
    inputText += "</div>"

    document.getElementById("modalGeneral").innerHTML = inputText;

    document.getElementById("modalConcept").innerHTML = "<div class='row'><h2>Concepts used in activity:</h2></div>";
    inputText = "";

    for(var i=0; i<conceptsUsed.length; i++)
    {
        var bar = '<div class="progress-bar" role="progressbar" style="background-color:#0D2E97; height: 15px; width:'+Math.floor(conceptsUsed[i].estimation*100)+'%; margin-top:5px;"></div>';

        inputText += "<div class='row'>"
            inputText += "<div class='col-sm-6'>"+ conceptsUsed[i].title +"</div>"
            inputText += "<div class='col-sm-1'>"+ Math.floor(conceptsUsed[i].estimation*100) +"%</div>"
            inputText += "<div class='col-sm-5'>"+ bar +"</div>"
        inputText += "</div>"

    }
    document.getElementById("modalConcept").innerHTML += inputText;

    document.getElementById('modal_close').onclick = function()
    {
        $('#'+id.id).closest('.toast').toast('hide')
        notifications.splice( notifications.indexOf(id.id), 1);
    }

    drawVisual(x,y,z);
}

function updateConceptBar()
{
    for (var i=0; i<concept.length; i++)
        document.getElementById('concept_bar'+concept[i].id).style.height = concept[i].estimation*100+"%"
}
