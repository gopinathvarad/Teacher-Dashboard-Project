* Retrieving selected info:
  * Use modal to display information
  * href to a new site that contains student information

* Time spent on solving each learning activity (for a given student):
	* in aggregate tracking, filter by activity-open and -close, the given activity, and user
	* in um2 user_activity, filter by activity, UserID, dateNtime
	    * A timeline may look like this: |II| || |III| (|...|=open/close, I=submission)
            * (ent_tracking) action.activity-id = ent_activity.Activity
            * If we are only finding the time for most recent submission:
                * take the submission, and check if there is an earlier submission
                    * If there is an earlier submission:
                        * Calculate the time between submissions
                * Find the most recent activity open, and calculate time from then
                * Whatever value that is smaller (between activity-open/submission or submission/submission) is the time spent on activity
            * If we want total time spent 
                * Follow the process for an individual problem, and loop it over each submission
    
* Number of attempts for the student to correctly solve each learning activity [Completed(?)]
  * In um2 user_activity, filter by a UserId, ActivityID and group
  * count number of submission (var|length)

* Current score for the lab assignment as a whole (i.e., percentage of correctly solved learning activities)
  * correct assignments / number of assignments
  
* The student overall success rate on solving learning activities
  * correct attempts / total number of attempts

* Common mistakes done by the student on her submissions (e.g., syntax errors, compiling errors)
  
* Estimated level of knowledge at a conceptual level (e.g., modulus, substring, if-else, for loop, etc.)
  
* Number of mistakes made on each learning activity
  * i.e. number of errors

* Identifying which students are at-risk (i.e., low-performers)

* Identifying high-performing students who could help assisting their peers

* Detecting the students' pace to complete the learning activities
  * Time spent on submission
  * Estimated time when user is done with assignment (will he get done??)
  
* Being able to share statistics of the class average performance with the rest of the class

* Having access to a list that shows the students that have explicitly requested help

* Detecting the most common mistakes the overall class is making when solving the learning activities

* Identifying the concepts (e.g., modulus, substring, if-else, for loop, etc.) that are hard for students to grasp

* Identifying subgroups of students facing similar problems in their learning process

* Exploring the most common responses submitted by students on each problem
