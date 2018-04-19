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
    validates :name, :presence => true

    def level_up(current_user, points, image_urls)
        levels = [50, 300, 600, 1200, 2400, 4800]
        dragon = current_user.team.dragon
        xp = dragon.xp + points
        level = dragon.level
        dragon.update_attributes!(:xp => xp)
        if level < levels.length && xp >= levels[level]
            dragon.update_attributes(:level => level + 1)
            case dragon.color
            when 'Green'
                picture_path = image_urls[1][0]
            when 'Blue'
                picture_path = image_urls[1][1]
            when 'Yellow'
                picture_path = image_urls[1][4]
            when 'Red'
                picture_path = image_urls[1][3]
            when 'Purple'
                picture_path = image_urls[1][2]
            end
            dragon.update_attributes!(:picture_path => picture_path)
        end
    end
end
