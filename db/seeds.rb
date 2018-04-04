# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

<<<<<<< HEAD
dragons = Team.create!(:name => 'TaskDragon')
#dragons = Team.create!(:name => 'TaskDragon')
Dragon.create!(:name => 'Dragon', :picture_path => 'whatever', :xp => 0, :level => 0, :team => Team.find(1))
=======
# dragons = Team.create!(:name => 'TaskDragon')
# Dragon.create!(:name => 'Dragon', :picture_path => 'whatever', :xp => 0, :level => 0, :team => Team.find(1))

#run seed with first two lines
#start server , make account log in, make new team, once saved, its gonna break, go back to seed file and comment out two lines on top
#add dragon to your specific team and rails db:seed in command line and run server again


>>>>>>> e0f77dbf237bde4a772a227a6a6a1ed5023d1efa
