## orchestraNOW

Users will see a calendar of view of all orchestra services (rehearsals and concerts)

Users can:
* CRUD services
* Assign Works to Services via ServiceWorks (Program)
* Create and Edit new Works and Composers
* Order Works on a program through ServiceWorks (Program)
* Create New User (Sign-up) locally or via Omniauth (google?)
   
Future Features:
* Roles (Admin and Perfomer) 
    * Admin full function, Performer view only
* Instrumentation stored as integer for each instrument instead of string "2.2.2.2-4.2.2.1"

# Models
User
* email 
* password_digest

UserServices
* user_id 
* service_id
* action:boolean (create or update)

Service
* start_time
* end_time
* type:boolean (Rehearsal or Concert)

ServiceWorks (Program)
* order (user created attribute - Order in program)
* service_id
* works_id 

Works 
* composer_id
* title
* instrumentation:string

Composer
* name
* birth_year
* death_year

# First Sprint
 * Set-up models DONE
 * Services Page (new '/services/new', calendar view '/' and services index 'services#index')


# REACH GOALS
* Styling
* Create new works and composers


