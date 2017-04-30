class RoutineLog < ActiveRecord::Base
  belongs_to :routine
  has_many :routine_task_logs, dependent: :destroy
  after_create :create_routine_task_logs

  def create_routine_task_logs
    for rt in self.routine.routine_tasks do
      params = [complete: rt.complete, detail: rt.detail, response: rt.response]
      self.routine_task_logs.create(params)
    end
  end
end
