class ItemsController < ApplicationController

    def show
        @item = Item.find(params[:id])
    end
    
    def new
        @project = Project.find(params[:project_id])
        @room = Room.find(params[:room_id])
        @item = Item.new
    end

    def create
        @project = Project.find(params[:project_id])
        @room = Room.find(params[:room_id])
        updated_params = {
            name: item_params[:name],
            cost: item_params[:cost].to_i,
            room: @room,
        }
        @item = Item.new(updated_params)
    
        if @item.save
          redirect_to project_room_item_path(@project, @room, @item)
        else
          render :new, status: :unprocessable_entity
        end
    end

    private
    def item_params
      params.require(:item).permit(:name, :cost)
    end
end

