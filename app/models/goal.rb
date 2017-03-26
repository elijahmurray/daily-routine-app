class Goal < ActiveRecord::Base
  DURATIONS_IN_MONTHS = [1,3,6,12,24,36,60,120]

  validates :name, presence:true
  validates :time_to_complete, presence:true

end
