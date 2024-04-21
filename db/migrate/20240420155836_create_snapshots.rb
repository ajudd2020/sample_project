class CreateSnapshots < ActiveRecord::Migration[7.1]
  def change
    create_table :snapshots do |t|
      t.datetime :date
      t.integer :total_cost
      t.json :daily_changes
      t.references :project, null: true, foreign_key: true
      t.references :room, null: true, foreign_key: true

      t.timestamps
    end
  end
end
