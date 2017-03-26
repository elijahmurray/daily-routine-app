module GoalsHelper

  def humanized_goal_durations
    Goal::DURATIONS_IN_MONTHS.map do |d| 
      if d < 12
        pluralize(d.to_s, "Month")
      else
        pluralize((d/12).to_s, "Year")
      end
    end
  end
end
