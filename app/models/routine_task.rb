class RoutineTask < ActiveRecord::Base
  belongs_to :routine

  validates :detail, presence: :true
  validates :task_type, presence: true

end
