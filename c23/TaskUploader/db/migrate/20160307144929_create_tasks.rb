class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.text :tests

      t.timestamp null: false
    end
  end
end
