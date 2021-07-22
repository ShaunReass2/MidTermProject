##    Contractor Management System (CMS)
###   --------------------------------
###   Skill Distillery Midterm Project

### Team Members

 * Brandon Stine
 * Timothy Shumway
 * David Estrada, Database Administrator
 * Shaun Reass, Scrum Master

### Overview

This application provides a platform on which General Contractors (GCs) and various tradespeople can coordinate their efforts by scheduling tasks, messaging one another for planning and deconfliction, and to distribute pertinant information regarding jobs.  

### Technologies Used

  * Coding Languages: Java, SQL, JPQL, HTML5, CSS
  * Conditionals
  * Looping
  * Object-Oriented Design
  * Try-Catch Statements
  * Exceptions
  * Spring Data JPA
  * Spring Boot
  * Model View Controller (MVC) pattern
  * Gradle
  * MySQL Workbench
  * Agile, Interactive, and Pair Programming Design

### Graphic Examples

<img src="ContractManagementSystem/src/main/webapp/Pictures/ER_MidTerm_Project_CMS" alt ="git" width="100" height="100" align="center"/>

### How to Run

Upon landing on the splash page, a user is greeted with the Contractor Management System (CMS) banner and moto at the top center, a top navbar allowing login (for established account holders only), two links for Administrator and Contractor sign up to the platform, and a bottom footer with developer names and information.  

For a person to use the platform, they must either sign up using one of the two links under the CMS banner: 1) Administrator Sign Up or 2) Contractor Sign Up.

After choosing the Administrator Sign Up option, which is the portion of the platform designed for GCs, the user will be prompted to enter required information to start an account, including: 1) username, 2) password, 3) first name, and 4) last name.  After doing so successfully, the user will be directed to a page informing them their account has been created successfully.  The user will then be able to return to the home page or click the "Login" button on the top right of the page, in the navbar.  Once logged in, the GC will be directed to a page where they are greeted with a welcome banner in the top center of the navbar, links in the top left of the page to either return to the home page or view completed jobs, a logout button and search jobs by keyword field in the top right, and a create job button below the welcome banner.  By choosing the Create Job button, the GC will be prompted to enter pertinent information regarding a job, including: 1) job name, 2) job location, 3) start date, 4) end date, 5) authorization of overtime, 6) total job hours, 7) hours of operation for the job site, 8) a job description field, and 9) a miscellaneous field where information regarding parking details, entry codes, safety information, etc can be recorded.  The GC can either close the input modal without storing the information by choosing "close" or choose to "submit" and store the information after it is entered.  After job information is stored, the information will display on the GC portal page, listing Job Name, Start Date, End Date, and a button to "View Job."  When the "View Job" is chosen, the GC is redirected to another page with the remaining job details they entered, in addition to option buttons to "Edit Job," "Mark Job Complete," "Delete Job," and "Create Task."  Additionally, any messages written to the GC are displayed on the left of the page with a field to reply.  If the edit button is chosen, the GC is able to make changes to the information entered on the prior page.  By choosing the "Mark Job Complete" button, the job will be marked as such on the ongoing job list.  The "Delete Job" button will prompt the user to confirm their wish to have the job deleted from the job list.  By choosing the "Create Task" button, the GC is prompted to enter the trade they wish to assign a task with via a drop down menu.  After choosing a trade, the GC is presented with a modal, prompting them for 1) task name, 2) task details, 3) priority number, 4) start time, 5) end time, and 6) contractor name(s). After completing and submitting the information, the GC will see the task name and details displayed on the right side of their portal.  The GC can choose to view task details, update task information, and mark the task complete using the appropriately labeled buttons in the list.  

From the home page, when a user chooses to sign up as a contractor, they are prompted to enter the same required information as the admin/GC to create an account.  Similarly, they are directed to a page confirming their account has been successfully created after submitting or to an error page if there was a problem with their input.  The contractor will also need to login using their credentials after their account has been successfully created.  After logging in, they will be directed to their portal where they can view a list of tasks to which they have been assigned.  The information on this page is similar to the admin/GC portal page, only the contractor is not able to create jobs -- only view them as mark tasks as completed.  Additionally, the are able to view and send messages.  

### Challenges

As the most challenging and complex project we have completed to date, the size and scope of CMS presented several challenges for its successful completion.  As a team of four developers, it became immediately apparent communication was a vital component.  Merge conflicts were something we worked hard to avoid, but every so often they still occurred, which required additional communication to fix.  While we became accustomed to creating and pushing updates to GitHub on different branches, we learned branch management was another important aspect of team development as our number of branches quickly grew and we needed to delete them periodically to stay organized.  Understanding the relationship between JPA entity objects took some time to successfully implement in such a complex project, specifically not using explicit variable names to pass secondary data.  Lazy loading in the entity framework also took some trial and error to fully implement, versus the eager loading we have been more accustomed to.  

### Lessons Learned

The use of Agile Workflow, especially the Trello kanban board, greatly assisted in driving the project forward.  As a whole, the team had many ideas to enhance the project, and proper project planning principles were made more efficient with frequent visits to our Trello site to add/check-off tasks.  This further amplified our understanding of how vital communication is on such projects.  Along those same lines, separation of concerns for file splitting and the use of decoupling allowed us to work asynchronously.  The value of pair programming during this project was highlighted by allowing the team to push through frustrating portions of code where one team member, working solo, might otherwise become stuck.  Simple typos, capable of breaking the entire program, were often spotted and subsequently corrected while pair programming.  Having the extra sets of eyes saved our team -- what could have been -- several collective hours of solo troubleshooting.  
