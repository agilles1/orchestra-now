<h1 align="center">orchestraNOW</h1>

<div align="center">
  orchestraNOW is an orchestra service management platform. Users can create Services (rehearsal or concerts) and assign repertoire (Works) to those Services. 
</div>
<br/>
<p align="center">
  <img max-height: 90% width="100%" src="https://media.giphy.com/media/HKcmbPr0bl3TUo2Odi/giphy.gif" alt="gif of the app">
</p>

## Features 
- Sign in/Sign up option with authenticated password
- Integrated Google OmniAuth
- Full CRUD capabilities for service and works
- Calendar and List view of all services
 
## Tech Stack
This web app makes use of the following:
- Ruby [2.6.1]
- Rails [~> 6.0.3] - MVC Web Framework
- SQLite3 [~> 1.4] - Database
- BCrypt [~> 3.1.7] - Gem for encryption
- Simple-Calendar

## Installing

- Clone this repo to you7r local machine `git clone <this-repo-url>`
- run `bundle install` to install required dependencies
- run `rails db:create` to create a database locally.
- run `rails db:migrate` to create tables into the database.
- run `rails db:seed` to create seed data.
- run `rails s` to run the server. 

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


## License
[MIT](https://choosealicense.com/licenses/mit/)