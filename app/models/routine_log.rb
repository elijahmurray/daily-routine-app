class RoutineLog < ActiveRecord::Base
  belongs_to :routine
  has_many :routine_task_logs
  after_initialize :create_routine_task_logs
  def create_routine_task_logs
    for r in self.routine.routine_tasks do
      self.routine_task_logs.new(complete: r.complete, detail: r.detail, response: r.response)
    end
  end
end
