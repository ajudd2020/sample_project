class PrepareProjectSnapshot < ApplicationJob

    def perform
        project = Project.all
        project.each do |project|
            added_rooms_hash = {}
            today_rooms = project.rooms.where("created_at > ? AND created_at < ?", DateTime.now.beginning_of_day, DateTime.now.end_of_day)
            today_rooms.each do |room|
                added_rooms_hash[room.name] = room.cost
            end
            snap_shot_params = {
                date: Date.today,
                daily_changes: added_rooms_hash.to_json,
                project: project,
                total_cost: project.current_budget
            }
            project_snap = Snapshot.new(snap_shot_params)
            if !project_snap.save
                rails "Cannot create snap"
            end
            puts "project" 
            puts project_snap.total_cost
        end
    end
end