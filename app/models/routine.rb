class Routine < ActiveRecord::Base
  belongs_to :user
  has_many :routine_tasks
end
