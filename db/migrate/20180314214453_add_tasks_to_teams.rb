class AddTasksToTeams < ActiveRecord::Migration[5.1]
  def change
    drop_table("tasks")
    create_table "tasks" do |t|
      t.string "title"
      t.text "description"
      t.integer "priority"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.boolean "complete", default: false
      t.datetime "due"
      t.references :team, foreign_key: true
    end
  end
end
