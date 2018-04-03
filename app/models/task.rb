# == Schema Information
#
# Table name: tasks
#
#  id          :integer         not null, primary key
#  title       :string
#  description :text
#  priority    :integer
#  team_id     :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  complete    :boolean         default("f")
#  due         :datetime
#

class Task < ActiveRecord::Base
    belongs_to :team
    validates :title, :presence => true
end
