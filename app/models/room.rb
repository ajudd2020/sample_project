class Room < ApplicationRecord
  after_update :update_project_cost
  after_create :update_project_cost

  belongs_to :project
  has_many :items
  has_many :snapshots

  validates :name, presence: true
  validates :cost, presence: true

  enum :status, ['in_progress', 'on_hold', 'complete']

  # VALID_STATUSES = ['in_progress', 'on_hold', 'complete']

  # validates :status, inclusion: { in: VALID_STATUSES }

  private

    def self.record_daily_status
      PrepareRoomSnapshot.perform_now
    end

    def update_project_cost
      updated_cost = 0
      self.project.rooms.each do |room| 
        updated_cost += room.cost
      end

      self.project.current_budget = updated_cost
      self.project.save!
    end
end
