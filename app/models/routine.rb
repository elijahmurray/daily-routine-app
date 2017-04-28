class Routine < ActiveRecord::Base
  belongs_to :user
  has_many :routine_tasks
  has_many :routine_logs

  def reset
    self.routine_tasks.each do |rt|
      rt.update_attributes(response: '', complete: false)
    end
  end
end
