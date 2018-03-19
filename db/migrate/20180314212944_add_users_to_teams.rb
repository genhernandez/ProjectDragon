class AddUsersToTeams < ActiveRecord::Migration[5.1]
  def change
    drop_table("users")
    create_table "users" do |t|
      t.string "provider"
      t.string "uid"
      t.string "name"
      t.string "oauth_token"
      t.datetime "oauth_expires_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.references :team, foreign_key: true
    end
  end
end
