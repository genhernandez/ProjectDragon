# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dragons = Team.create!(:name => 'TaskDragon')

task1 = Task.create!(:title => 'task1', :description => 'this is a task to complete', :priority => 3, :complete => false, :due => DateTime.now, :team_id => 1)

task2 = Task.create!(:title => 'task2', :description => 'very important', :team_id_id => dragons.id, :priority => 1, :complete => true, :due => DateTime.now, :team_id => 1)
