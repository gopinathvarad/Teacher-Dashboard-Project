from django.urls import path
from . import views
urlpatterns = [
    # Main URLS
    path('TA_Dashboard/', views.createSession, name='selectLab'),
    path('TA_Dashboard/svc=<str:topic_id>;group=<str:group_id>/', views.loadingScreen),
    path('TA_Dashboard/svc=<str:topic_id>;group=<str:group_id>/dashboard/', views.ta_dashboard, name='dashboard'),
    path('TA_Dashboard/svc=<str:topic_id>;group=<str:group_id>/Class_Chart/', views.class_chart, name='classMap'),

    # AJAX URLS
    path('TA_Dashboard/getLabs/<str:group_id>/', views.retrieveLabs),
    path('TA_Dashboard/setMode/<str:mode>/', views.setMode),
    path('TA_Dashboard/svc=<str:topic_id>;group=<str:group_id>/dashboard/update', views.update_table),
    path('TA_Dashboard/svc=<str:topic_id>;group=<str:group_id>/dashboard/getTables', views.getArrays),
    path('TA_Dashboard/svc=<str:topic_id>;group=<str:group_id>/dashboard/userInfo/<str:userID>', views.userInfo),
    path('TA_Dashboard/svc=<str:topic_id>;group=<str:group_id>/dashboard/activityInfo/<str:activityID>', views.activityInfo),
    path('TA_Dashboard/svc=<str:topic_id>;group=<str:group_id>/dashboard/cellInfo/<str:activityID>/<str:userID>', views.cellInfo),
    path('TA_Dashboard/svc=<str:topic_id>;group=<str:group_id>/dashboard/conceptInfo/<str:conceptID>', views.conceptInfo),
    path('TA_Dashboard/svc=<str:topic_id>;group=<str:group_id>/dashboard/modalInfo/<str:activityID>/<str:userID>', views.modalInfo),
    path('TA_Dashboard/svc=<str:topic_id>;group=<str:group_id>/Class_Chart/updateSeat/<str:log>/<str:r>/<str:c>/<str:s>', views.updateSeat),
    path('TA_Dashboard/svc=<str:topic_id>;group=<str:group_id>/Class_Chart/updateClass/<str:r>/<str:c>/<str:s>', views.updateClassDimension),
    path('getClass', views.getClassDimension),
    path('getMode', views.getMode),
]

