class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :cost
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
