class Goal < ActiveRecord::Base
  DURATIONS_IN_MONTHS = [1,3,6,12,24,36,60,120]

  def  self.durations
    DURATIONS_IN_MONTHS.map do |d| 
      if d < 12
        d.to_s + " Months"
      else
        (d/12).to_s + " Years"
      end
    end
  end
end
