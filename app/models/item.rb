class Item < ApplicationRecord

  after_create :update_room_cost

  belongs_to :room

  private
    def update_room_cost
      self.room.cost = self.room.cost + self.cost
      self.room.save!
    end
end
