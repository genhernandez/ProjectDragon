class CreateTasks < ActiveRecord::Migration[5.1]
  def up
    create_table 'tasks' do |t|
      t.string 'title'
      t.text 'description'
      t.integer 'priority'
      t.integer 'team_id'
      # t.references :team, index: true
      t.timestamps
    end
  end

  def down
    drop_table 'tasks' # deletes the whole table and all its data!
  end
end


