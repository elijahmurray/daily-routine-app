class Routine < ActiveRecord::Base
  belongs_to :user
  has_many :routine_tasks, dependent: :destroy
  has_many :routine_logs, dependent: :destroy
  validates :name, presence: :true
  validates :repeat_frequency, presence: :true

  REPEAT_FREQUENCY = ['Daily', 'Weekly', 'Monthly', 'Yearly']

  def reset
    self.routine_tasks.each do |rt|
      rt.update_attributes(response: '', complete: false)
    end
  end
end
