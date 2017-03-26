module GoalsHelper
  def pretty_due_date(goal)
    goal.due_date.strftime("%b %e, %Y")
  end
end
