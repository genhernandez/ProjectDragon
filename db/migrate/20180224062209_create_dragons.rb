class CreateDragons < ActiveRecord::Migration[5.1]
  def up
    create_table 'dragons' do |t|
      t.string 'name'
      t.string 'picture_path'
      t.integer 'xp'
      t.integer 'level'
      t.integer 'team_id'
      t.timestamps
    end
  end

  def down
    drop_table 'dragons' # deletes the whole table and all its data!
  end
end
