class Routine < ActiveRecord::Base
  belongs_to :user
  has_many :routine_tasks
  has_many :routine_logs
end
