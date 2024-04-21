class Project < ApplicationRecord
  has_many :rooms
  has_many :snapshots, dependent: :nullify

  before_update :verify_budget
  validates :title, presence: true
  validates :budget, presence: true

  VALID_STATUSES = ['in_progress', 'on_hold', 'complete']

  validates :status, inclusion: { in: VALID_STATUSES }

  private

  def self.record_daily_status
    PrepareProjectSnapshot.perform_now
  end

    def verify_budget
        if self.current_budget > self.budget
            raise Exception.new "Project is over budget!"
        end
    end
end
