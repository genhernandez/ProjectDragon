class CreateUsers < ActiveRecord::Migration[5.1]  
  def up
    create_table 'users' do |t|
      t.string 'username'
      t.string 'password'
      t.string 'email'
      t.boolean 'team_leader', :default => false
      t.integer 'team_id'
      # t.references :team, index: true
      t.timestamps
    end
  end

  def down
    drop_table 'users' # deletes the whole table and all its data!
  end
end
