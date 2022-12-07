from django.shortcuts import render
from .models import *
from django.http.response import JsonResponse, HttpResponse

# Global Variables
initialized = False
remoteMode = False
classDimensions = {'r': 4, 'c': 2, 's': 5}
students = []
activities = []
concepts = []

'''
    RENDER FUNCTIONS
'''

def createSession(request):
    global students
    global activities
    global concepts
    global initialized
    students = []
    activities = []  # stores values as content
    concepts = []  # add another field which is its default size computed models, that way when mouse leave then we just
    initialized = False

    offer_groups = Group.objects.using('db_aggregate').all().order_by('group_name')

    return render(request, 'set_up.html', {
        'group': offer_groups,
    })

def loadingScreen(request, topic_id, group_id):
    redirect = "Class_Chart/"
    if remoteMode == "true":
        redirect = "dashboard/"
    return render(request, 'loadingScreen.html', {
        'redirect': redirect,
        'active': 'loading',
    })

def ta_dashboard(request, topic_id, group_id):
    global initialized
    if not initialized:
        initialized = True

        func(topic_id)
        CreateStudentArray(group_id)
        estimateAggregate(group_id)

    return render(request, 'dashboard.html', {
        'SVC': Topic.objects.using('db_aggregate').get(topic_id=topic_id),
        'group': Group.objects.using('db_aggregate').get(id=group_id),
        'activities': activities,
        'users': students,
        'concepts': concepts,
        'active': 'dashboard',
    })

def class_chart(request, topic_id, group_id):
    global initialized
    if not initialized:
        initialized = True

        func(topic_id)
        CreateStudentArray(group_id)
        estimateAggregate(group_id)

    return render(request, 'Class_Chart.html', {
        'SVC': Topic.objects.using('db_aggregate').get(topic_id=topic_id),
        'group': Group.objects.using('db_aggregate').get(id=group_id),
        'students': students,
        'active': 'classChart',
    })

'''
    AJAX methods
'''

def setMode(request, mode):
    global remoteMode
    remoteMode = mode
    return HttpResponse("")

def getMode(request):
    return JsonResponse({'mode': remoteMode})

def retrieveLabs(request, group_id):
    labs = []
    selected_group = Group.objects.using('db_aggregate').get(id=group_id)
    # retrieve all labs for this group
    course = Course.objects.using('db_aggregate').get(course_id=selected_group.course_id)

    if "lab" in course.desc:
        get_lab = course.desc.replace('lab:', '')
        course = Course.objects.using('db_aggregate').get(course_id=get_lab)
    offer_labs = Topic.objects.using('db_aggregate').filter(course_id = course.course_id)

    for lab in offer_labs:
        labs.append({'id': lab.topic_id, 'display': lab.display_name})
    return JsonResponse({'labs': labs})

def update_table(request, topic_id, group_id):
    current_group = Group.objects.using('db_aggregate').get(id = group_id)
    all_attempts_by_group = UserActivity.objects.using('db_um2').filter(AllParameters__contains="grp=" + current_group.group_id) #add another filter that is login from arr?

    student_activity = []

    for userActivity in all_attempts_by_group:
        tokenPerameter = userActivity.AllParameters.split(";")
        tokenUser = tokenPerameter[1].split("=")

        if any(a['id'] == userActivity.ActivityID for a in activities) and any(s['login'] == tokenUser[1] for s in students):
            create_dict = dict(
                {'activity': userActivity.ActivityID,
                 'student': tokenUser[1],
                 'result': userActivity.Result})
            student_activity.append(create_dict)

    return JsonResponse({'info':student_activity})

def getArrays(request, topic_id, group_id):
    return JsonResponse({'students':students, 'activities':activities, 'concepts':concepts})

def userInfo(request, topic_id, group_id, userID):
    convertToList = []
    convertToList.append(userID)
    estimatedConcepts = retrieveStudentKnowledgeList(convertToList, group_id, concepts) # ESTIMATED KNOWLEDGE OF STUDENT
    user = User.objects.using('db_portal_test2').get(Login=userID)
    return JsonResponse({'name': user.Name, 'estimations': estimatedConcepts})

def activityInfo(request, topic_id, group_id, activityID):
    um2Activity = Activity.objects.using('db_um2').get(ActivityID=activityID)
    aggregateActivity = Content.objects.using('db_aggregate').filter(content_name=um2Activity.Activity).first()

    hoverConcepts = conceptsUsed(activityID) # Retrieve concepts used in activity

    return JsonResponse({'display': aggregateActivity.display_name, 'description':um2Activity.Description, 'concepts': hoverConcepts})

def cellInfo(request, topic_id, group_id, activityID, userID):
    user = User.objects.using('db_portal_test2').get(Login=userID)
    um2Activity = Activity.objects.using('db_um2').get(ActivityID=activityID)
    aggregateActivity = Content.objects.using('db_aggregate').filter(content_name=um2Activity.Activity).first()

    hoverConcepts = conceptsUsed(activityID) # Retrieve concepts used in activity

    convertToList = []
    convertToList.append(userID)
    estimatedConcepts = retrieveStudentKnowledgeList(convertToList, group_id, concepts) # ESTIMATED KNOWLEDGE OF STUDENT

    return JsonResponse({'user': user.Name,'activity':aggregateActivity.display_name, 'concepts': hoverConcepts, 'estimations': estimatedConcepts})

def conceptInfo(request, topic_id, group_id, conceptID):
    hoveredConcept = Concept.objects.using('db_um2').get(ConceptID=conceptID)
    return JsonResponse({'title': hoveredConcept.Title, 'description':hoveredConcept.Description})

def modalInfo(request, topic_id, group_id, activityID, userID):
    group = Group.objects.using('db_aggregate').get(id=group_id)
    # Add time spent on activity, only need latest
    userActivity = UserActivity.objects.using('db_um2').filter(ActivityID=activityID, AllParameters__contains="usr="+userID).order_by('DateNTime').first()
    userTracking = Tracking.objects.using('db_aggregate').filter(group_id=group.group_id, user_id=userID).order_by('datentime').first()
    timeSpent = (userActivity.DateNTimeNS - userTracking.datentime.timestamp())/1000000000

    user = User.objects.using('db_portal_test2').get(Login=userID)
    um2Activity = Activity.objects.using('db_um2').get(ActivityID=activityID)
    aggregateActivity = Content.objects.using('db_aggregate').filter(content_name=um2Activity.Activity).first()

    usedConcepts = conceptsUsed(activityID)  # Retrieve concepts used in activity
    convertToList = []
    convertToList.append(userID)
    estimatedConcepts = retrieveStudentKnowledgeList(convertToList, group_id, usedConcepts)  # ESTIMATED KNOWLEDGE OF STUDENT

    return JsonResponse({'user': user.Name, 'activity': aggregateActivity.display_name, 'concepts': estimatedConcepts, 'time':timeSpent})

def updateSeat(request, topic_id, group_id, log, r, c, s):
    for student in students:
        if student['login'] == log:
            student['row'] = r
            student['col'] = c
            student['seat'] = s
            return HttpResponse("")
    return HttpResponse("")

def updateClassDimension(request, topic_id, group_id, r, c, s):
    classDimensions['r'] = r
    classDimensions['c'] = c
    classDimensions['s'] = s
    return HttpResponse("")

def getClassDimension(request):
    return JsonResponse(classDimensions)

'''
    Other functions
'''

def retrieveStudentKnowledgeList(login, group_id, conceptList): # login is a list of student attributes
    estimatedConcepts = []
    group = Group.objects.using('db_aggregate').get(id=group_id)
    computedModel = ComputedModel.objects.using('db_aggregate').filter(course_id=group.course_id).order_by('last_update')

    for userModel in computedModel:
        if any(l == userModel.user_id for l in login): # if this student (model) is in the list of student
            allModels = userModel.model4kc.split("|")
            for model in allModels: #loop over all model concepts
                try:
                    splitEntry = model.split(":")

                    kc_id = splitEntry[0] #this is actually the kc id
                    restOfList = splitEntry[1].split(",")
                    estimation = float(restOfList[0])

                    # now get kc_component based on id and get the correct concept from there
                    kcComponent = Component.objects.using('db_aggregate').get(id=kc_id)
                    concept_data = Concept.objects.using('db_um2').filter(Title=kcComponent.component_name).first()
                    if any(c['id'] == concept_data.ConceptID for c in conceptList):
                        estimatedConcepts.append({'id': concept_data.ConceptID, 'title': concept_data.Title, 'estimation': estimation})
                except:
                    continue
    return estimatedConcepts

def conceptsUsed(activityID):
    conceptsUsed = ConceptActivity.objects.using('db_um2').filter(ActivityID=activityID).values('ConceptID')

    hoverConcepts = []
    for concept in conceptsUsed:
        c = Concept.objects.using('db_um2').get(ConceptID=concept.get('ConceptID'))
        hoverConcepts.append({'id': c.ConceptID, 'title': c.Title})

    return hoverConcepts

def CreateStudentArray(group_id):
    selected_group = Group.objects.using('db_aggregate').get(id=group_id)
    portal_user_group = User.objects.using('db_portal_test2').get(Login=selected_group.group_id)
    students_shown_as_child = UserUser.objects.using('db_portal_test2').values('ChildUserID').filter(ParentUserID=portal_user_group.UserID)

    for student in students_shown_as_child:
        child_id = student.get('ChildUserID')  # gets the value from dict
        student_data = User.objects.using('db_portal_test2').get(UserID=child_id)

        get_user_login = student_data.Login

        if get_user_login not in students:
            students.append({'login': get_user_login, 'row': -1, 'col': -1, 'seat': -1})

def func(topic_id):
    # Retrieve all students for this group/lab
    all_content = TopicContent.objects.using('db_aggregate').filter(topic_id=topic_id)  # get all activities for lab

    # retrieve all activities and concepts
    for activity in all_content:  # date n time of last sub
        this_content = Content.objects.using('db_aggregate').get(content_id=activity.content_id)
        um2_activity = Activity.objects.using('db_um2').filter(Activity=this_content.content_name).first()  # Convert from aggregate.content to um2.activity
        display_name = this_content.display_name
        this_id = um2_activity.ActivityID

        if not any(a['id'] == this_id for a in activities):  # new activity
            activities.append({'id': this_id, 'display': display_name})
            usedConcepts = conceptsUsed(this_id)  # list of all concepts used in activity

            for checkConcept in usedConcepts:  # check each concept in found list
                if not any(c['id'] == checkConcept['id'] for c in concepts):  # not in list
                    this_concept = Concept.objects.using('db_um2').get(ConceptID=checkConcept['id'])
                    concepts.append({'id': this_concept.ConceptID, 'title': this_concept.Title, 'desc': this_concept.Description,'estimation': 0})

def estimateAggregate(group_id):
    # for each student, get their estimations and aggregate
    studentEstimations = retrieveStudentKnowledgeList([s['login'] for s in students], group_id, concepts)
    for concept in concepts:  # Loop over all c
        for estimate in studentEstimations:  # Loop over all student estimations
            if estimate['id'] == concept['id']:
                concept['estimation'] += estimate['estimation']
                break