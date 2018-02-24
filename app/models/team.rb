class Team < ActiveRecord::Base
    has_many :users
    has_many :tasks
    # has_one :dragon
end