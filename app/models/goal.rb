class Goal < ActiveRecord::Base
  DURATIONS_IN_MONTHS = {1 => "1 Month",
                         3 => "3 Months",
                         6 => "6 Months",
                         12 => "1 Year",
                         24 => "2 Years",
                         36 => "3 Years",
                         60 => "5 Years",
                         120 => "10 Years"}

  validates :name, presence:true
  validates :duration, presence:true

end
