class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :budget
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
