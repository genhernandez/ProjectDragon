# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dragons = Team.create!(:name => 'TaskDragon')
lameTeam = Team.create!(:name => 'less cool team')

User.create!(:username => 'Taylor', :password => 'this is a bad idea', :email => 'tsandusky@mills.edu', :team_leader => false, :team => Team.find_by_name('TaskDragon'))

User.create!(:username => 'Genesis', :password => 'still a bad idea', :email => 'ghernandez@mills.edu', :team_leader => true, :team => Team.find_by_name('TaskDragon'))

User.create!(:username => 'Norman', :password => 'password', :email => 'dog@dog.come', :team_leader => true, :team => lameTeam)

Task.create!(:title => 'task1', :description => 'this is a task to complete', :priority => 3, :team => dragons, :complete => false, :due => DateTime.now)

Task.create!(:title => 'task2', :description => 'very important', :priority => 1, :team => dragons, :complete => true, :due => DateTime.now)

Dragon.create!(:name => 'Friend', :picture_path => 'path', :xp => 200, :level => 1, :team => dragons)

Dragon.create!(:name => 'Patrick', :picture_path => 'path', :xp => 200, :level => 4, :team => lameTeam)