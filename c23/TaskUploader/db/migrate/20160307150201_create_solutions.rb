class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
    t.integer :task_id
    t.text :code
    t.text :author

    t.timestamps null: false
    end
  end
end
