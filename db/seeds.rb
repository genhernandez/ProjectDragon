# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Team.create!(:name => 'TaskDragon')
Dragon.create!(:name => 'Dragon', :picture_path => '/img/dragons/green_dragon.gif', :xp => 0, :level => 0, :team => Team.find(1))

#run seed with first two lines
#start server , make account log in, make new team, once saved, its gonna break, go back to seed file and comment out two lines on top
#add dragon to your specific team and rails db:seed in command line and run server again
