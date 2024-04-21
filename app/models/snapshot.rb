class Snapshot < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :room, optional: true
end
