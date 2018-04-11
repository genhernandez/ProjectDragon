class AddColorToDragon < ActiveRecord::Migration[5.1]
  def change
    add_column :dragons, :color, :string
  end
end
