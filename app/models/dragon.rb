# == Schema Information
#
# Table name: dragons
#
#  id           :integer         not null, primary key
#  name         :string
#  picture_path :string
#  xp           :integer
#  level        :integer
#  team_id      :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Dragon < ActiveRecord::Base
    belongs_to :team
end
