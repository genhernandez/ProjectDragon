# README

* Project TaskDragon is a project created by Madison Hamilton, Genesis Hernandez, Karena Huang, and Taylor Sandusky
 
* Here is the link to the website: https://taskdragon.herokuapp.com/pages/home

* Purpose of Project TaskDragon is to teach users how to code

* Users will be in groups and have the freedom to be in what position they want

* Users will also be able to assign tasks to each other to level up their dragons, because they would be 
    working towards leveling up the same dragon as the others in their group

* Ruby version: 2.4.1

* Rails version: 5.1.5 

* To check what version you have, you can type "rails -v" or "ruby -v" in terminal

* If you'd like to run the project from your local server here are deployment instructions using Ruby on Rails!: 
 
* Clone from https://github.com/genhernandez/TaskDragon.git

* First, make sure to change directory into the right folder to run the files in that folder
 
* So, enter "cd foldername" in the command line to go into that folder

* Now enter into the command line: "rails db:migrate" to create a database

* Follow that entry with: "rails db:seed" to initialize the database

* You'll want to install the necessary gems to run the project with the command: "bundle install --wtihout production"

* Make sure you have rails all setup before trying to run the project locally! 

* Finally to install enter this line into the command line: "rails server -p $PORT -b $IP"