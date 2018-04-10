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

    def level_up(current_user)
        levels = [100, 300, 600, 1200, 2400, 4800]
        dragon = current_user.team.dragon
        xp = dragon.xp + 10
        level = dragon.level
        dragon.update_attributes!(:xp => xp)
        if level < levels.length && xp >= levels[level]
            dragon.update_attributes(:level => level + 1)
        end
    end
end
