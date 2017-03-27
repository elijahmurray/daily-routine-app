class RoutineTask < ActiveRecord::Base
  belongs_to :routine

  validates :detail, presence: :true
end
