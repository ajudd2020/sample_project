class PrepareRoomSnapshot < ApplicationJob

    def perform
        rooms = Room.all
        rooms.each do |room|
            added_items_hash = {}
            today_items = room.items.where("created_at > ? AND created_at < ?", DateTime.now.beginning_of_day, DateTime.now.end_of_day)
            today_items.each do |item|
                added_items_hash[item.name] = item.cost
            end
            snap_shot_params = {
                date: Date.today,
                daily_changes: added_items_hash.to_json,
                room: room,
                total_cost: room.cost
            }
            room_snap = Snapshot.new(snap_shot_params)
            if !room_snap.save
                raise "Cannot create snap"
            end
        end
    end
end