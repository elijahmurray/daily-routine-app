class Routine < ActiveRecord::Base
  belongs_to :user
  has_many :routine_tasks
  has_many :routine_logs

  def reset
    self.routine_tasks.each do |rt|
      self.routine_tasks.create(detail: rt.detail, requires_response: rt.requires_response)
      rt.destroy
    end
  end
end
