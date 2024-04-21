class AddStatusToRoomAndProject < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :status, :string
    add_column :rooms, :status, :string
  end
end
