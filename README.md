# _Contractor Management System ( CMS )_

####   Skill Distillery Midterm Project

#### Team Members:
 * Shaun Reass, Scrum Master
 * David Estrada, Database Administrator
 * Brandon Stine
 * Timothy Shumway

### Overview

This application provides a platform on which General Contractors (GCs) and various tradespeople can coordinate their efforts by scheduling tasks, messaging one another for planning and deconfliction, and to distribute pertinant information regarding jobs.  

### Technologies

  * Java, SQL, HTML, CSS
  * Agile, Iterative, and Pair Programming Design
  * Object-Oriented Design
  * Exceptions & try-catch blocks
  * Spring Data JPA
  * RESTful API ( _Spring REST_ )
  * Model View Controller ( _MVC_ ) pattern
  * MySQL Workbench

### You can find the app here:
  * http://18.119.82.56:8080/ContractManagementSystem/

### The DB Schema

<img src="https://i.ibb.co/v1SC1Gy/contractingdb.png" alt ="git" width="600" height="400" align="center"/>

### Splash Page

<img src="https://i.ibb.co/FB3gLQJ/Screen-Shot-2021-07-22-at-6-53-11-PM.png" alt ="git" width="600" height="400" align="center"/>

### _Feel free to sign up!_

Upon landing on the splash page, a user is greeted with the Contractor Management System (CMS) banner and motto at the top center, a top navbar allowing login (for established account holders only), two links for Administrator and Contractor sign up to the platform, and a bottom footer with developer names and information.  For a person to use the platform, they must either sign up using one of the two links under the CMS banner: 1) Administrator Sign Up or 2) Contractor Sign Up.

### Challenges

As the most challenging and complex project we have completed to date, the size and scope of CMS presented several challenges for its success.  As a team of four developers, it became immediately apparent communication was a vital component.  Merge conflicts were something we worked hard to avoid, but every so often they still occurred, which required additional communication to fix.  While we became accustomed to creating and pushing updates to GitHub on different branches, we learned branch management was another important aspect of team development as our number of branches quickly grew and we needed to delete them periodically to stay organized.  Understanding the relationship between JPA entity objects took some time to successfully implement in such a complex project, specifically not using explicit variable names to pass secondary data.  Lazy loading in the entity framework also took some trial and error to fully implement, versus the eager loading we have been more accustomed to.  

### Lessons Learned

The use of Agile Workflow, especially the Trello kanban board, greatly assisted in driving the project forward.  As a whole, the team had many ideas to enhance the project, and proper project planning principles were made more efficient with frequent visits to our Trello site to add/check-off tasks.  This further amplified our understanding of how vital communication is on such projects.  Along those same lines, separation of concerns for file splitting and the use of decoupling allowed us to work asynchronously.  The value of pair programming during this project was highlighted by allowing the team to push through frustrating portions of code where one team member, working solo, might otherwise become stuck.  Simple typos, capable of breaking the entire program, were often spotted and subsequently corrected while pair programming.  Having the extra sets of eyes saved our team -- what could have been -- several collective hours of solo troubleshooting.  
