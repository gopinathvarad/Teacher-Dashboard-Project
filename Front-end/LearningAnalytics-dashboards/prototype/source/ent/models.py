from django.db import models

"""
The following classes are from the um2 data set
"""
'''
class UserUM2(models.Model):
    UserID = models.AutoField(primary_key=True)
    URI = models.CharField(max_length=255)
    Login = models.CharField(max_length=255)
    Name = models.CharField(max_length=255)
    Pass = models.CharField(max_length=255)
    IsGroup = models.IntegerField()
    IsAnyGroup = models.IntegerField()
    Sync = models.IntegerField()
    EMail = models.CharField(max_length=255)
    Organization = models.CharField(max_length=255)
    City = models.CharField(max_length=255)
    Country = models.CharField(max_length=255)
    How = models.CharField(max_length=255)

    class Meta:
        db_table = "ent_user"
'''
class Activity(models.Model):
    ActivityID = models.AutoField(primary_key=True)
    AppID = models.IntegerField()
    URI = models.CharField(max_length=255)
    Activity = models.CharField(max_length=255)
    Description = models.CharField(max_length=255)
    DateNTime = models.DateTimeField()
    active = models.IntegerField()

    class Meta:
        db_table = "ent_activity"

class UserActivity(models.Model):
    AppID = models.IntegerField()
    UserID = models.IntegerField()
    GroupID = models.IntegerField()
    Result = models.CharField(max_length=255)
    ActivityID = models.IntegerField()
    Session = models.CharField(max_length=25)
    DateNTime = models.CharField(max_length=25)
    DateNTimeNS = models.IntegerField()
    SVC = models.CharField(max_length=255)
    AllParameters = models.CharField(max_length=255)
    id = models.AutoField(primary_key=True)

    class Meta:
        db_table = "ent_user_activity"

class Domain(models.Model):
    DomainID = models.AutoField(primary_key=True)
    Title = models.CharField(max_length=45)
    Description = models.CharField(max_length=255)
    id = models.CharField(max_length=45)

    class Meta:
        db_table = "ent_domain"

class App(models.Model):
    AppID = models.AutoField(primary_key=True)
    Title = models.CharField(max_length=45)
    Description = models.CharField(max_length=255)
    OpenCorpus = models.IntegerField()
    SingleActivityReport = models.IntegerField()
    AnonymousUser = models.IntegerField()
    URIPrefix = models.CharField(max_length=45)

    class Meta:
        db_table = "ent_app"

class Concept(models.Model):
    ConceptID = models.AutoField(primary_key=True)
    Title = models.CharField(max_length=65)
    Description = models.CharField(max_length=255)

    class Meta:
        db_table = "ent_concept"

class ConceptActivity(models.Model):
    ConceptID = models.IntegerField()
    ActivityID = models.IntegerField()
    Weight = models.FloatField()
    Direction = models.IntegerField()
    DateNTime = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = "rel_concept_activity"

"""
The following classes are from the aggregate data set
"""
class ComputedModel(models.Model):
    id = models.AutoField(primary_key=True)
    user_id = models.CharField(max_length=100)
    course_id = models.IntegerField()
    last_update = models.DateTimeField()
    model4topics = models.TextField()
    model4content = models.TextField()
    model4kc = models.TextField()

    class Meta:
        db_table = "ent_computed_models"

class Course(models.Model):
    course_id = models.AutoField(primary_key=True)
    course_name = models.CharField(max_length=100)
    desc = models.CharField(max_length=500)
    course_code = models.CharField(max_length=50)
    domain = models.CharField(max_length=50)
    creation_date = models.DateTimeField()
    creator_id = models.CharField(max_length=50)
    visible = models.IntegerField()

    class Meta:
        db_table = "ent_course"

class Group(models.Model):
    id = models.AutoField(primary_key=True)
    group_id = models.CharField(max_length=100)
    group_name = models.CharField(max_length=250)
    course_id = models.IntegerField()
    creation_date = models.DateTimeField()
    term = models.CharField(max_length=50)
    year = models.IntegerField()
    creator_id = models.CharField(max_length=50)

    class Meta:
        db_table = "ent_group"

class Tracking(models.Model):
    id = models.AutoField(primary_key=True)
    datentime = models.DateTimeField()
    user_id = models.CharField(max_length=50)
    session_id = models.CharField(max_length=50)
    group_id = models.CharField(max_length=50)
    action = models.CharField(max_length=255)
    comment = models.CharField(max_length=300)

    class Meta:
        db_table = "ent_tracking"

class Content(models.Model):
    content_id = models.AutoField(primary_key=True)
    content_name = models.CharField(max_length=50)
    content_type = models.CharField(max_length=50)
    display_name = models.CharField(max_length=100)
    desc = models.CharField(max_length=500)
    url = models.CharField(max_length=500)
    domain = models.CharField(max_length=50)
    provider_id = models.CharField(max_length=100)
    comment = models.CharField(max_length=500)
    visible = models.IntegerField()
    creation_date = models.DateTimeField()
    creator_id = models.CharField(max_length=50)
    privacy = models.CharField(max_length=50)
    author_name = models.CharField(max_length=45)

    class Meta:
        db_table = "ent_content"

class Resource(models.Model):
    resource_id = models.AutoField(primary_key=True)
    resource_name = models.CharField(max_length=100)
    course_id = models.IntegerField()
    display_name = models.CharField(max_length=100)
    desc = models.CharField(max_length=500)
    order = models.IntegerField()
    visible = models.IntegerField()
    creation_date = models.DateTimeField()
    creator_id = models.CharField(max_length=50)
    update_state_on = models.CharField(max_length=3)
    window_width = models.IntegerField()
    window_height = models.IntegerField()

    class Meta:
        db_table = "ent_resource"

class Topic(models.Model):
    topic_id = models.AutoField(primary_key=True)
    course_id = models.IntegerField()
    topic_name = models.CharField(max_length=100)
    display_name = models.CharField(max_length=100)
    desc = models.CharField(max_length=500)
    parent = models.IntegerField()
    order = models.IntegerField()
    domain = models.CharField(max_length=50)
    creation_date = models.DateTimeField()
    creator_id = models.CharField(max_length=50)
    visible = models.IntegerField()
    active = models.IntegerField()

    class Meta:
        db_table = "ent_topic"

class ContentComponent(models.Model):
    id = models.AutoField(primary_key=True)
    content_name = models.CharField(max_length=200)
    component_name = models.CharField(max_length=200)
    context_name = models.CharField(max_length=200)
    domain = models.CharField(max_length=20)
    weight = models.FloatField()
    active = models.IntegerField()
    source_method = models.CharField(max_length=100)
    importance = models.IntegerField()
    contributesK = models.IntegerField()

    class Meta:
        db_table = "kc_content_component"

class TopicContent(models.Model):
    id = models.AutoField(primary_key=True)
    topic_id = models.IntegerField()
    resource_id = models.IntegerField()
    content_id = models.IntegerField()
    display_name = models.CharField(max_length=100)
    display_order = models.IntegerField()
    creation_date = models.DateTimeField()
    creator = models.CharField(max_length=50)
    visible = models.IntegerField()

    class Meta:
        db_table = "rel_topic_content"

class Component(models.Model):
    id = models.AutoField(primary_key=True)
    component_name = models.CharField(max_length=200)
    cardinality = models.IntegerField()
    display_name = models.CharField(max_length=100)
    domain = models.CharField(max_length=50)
    main_topic = models.CharField(max_length=100)
    active = models.IntegerField()
    main_component = models.CharField(max_length=100)
    threshold1 = models.DecimalField(max_digits=6, decimal_places=4)
    threshold2 = models.DecimalField(max_digits=6, decimal_places=4)

    class Meta:
        db_table = "kc_component"

"""
The following classes are from the portal_test2 data set
"""

class User(models.Model):
    UserID = models.AutoField(primary_key=True)
    URI = models.CharField(max_length=255)
    Login = models.CharField(max_length=30)
    Name = models.CharField(max_length=60)
    Pass = models.CharField(max_length=60)
    IsGroup = models.IntegerField()
    Sync = models.IntegerField()
    EMail = models.CharField(max_length=50)
    Organization = models.CharField(max_length=100)
    City = models.CharField(max_length=30)
    Country = models.CharField(max_length=50)
    How = models.CharField(max_length=255)
    IsInstructor = models.IntegerField()
    passActivatedByEmail = models.CharField(max_length=60)
    keyActivatedByEmail = models.CharField(max_length=60)

    class Meta:
        db_table = "ent_user"

class UserUser(models.Model):
    ParentUserID = models.IntegerField()
    ChildUserID = models.IntegerField()

    class Meta:
        db_table = "rel_user_user"