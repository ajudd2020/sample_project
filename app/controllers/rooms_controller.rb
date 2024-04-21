class RoomsController < ApplicationController

    def index
        @rooms = Project.find(params[:project_id]).rooms
    end

    def show
        @project = Project.find(params[:project_id])
        @room = Room.find(params[:id])
    end
    
    def new
        @project = Project.find(params[:project_id])
        @room = Room.new
    end

    def create
        @project = Project.find(params[:project_id])
        updated_params = {
            name: room_params[:name],
            cost: room_params[:cost].to_i,
            project: @project
        }

        @room = Room.new(updated_params)
    
        if @room.save
          redirect_to project_room_path(@project, @room)
        else
          render :new, status: :unprocessable_entity
        end
    end

    private
    def room_params
      params.require(:room).permit(:name, :cost)
    end
end
