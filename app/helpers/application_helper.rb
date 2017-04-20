module ApplicationHelper
  def pretty_date(date)
    date.strftime("%b %e, %Y")
  end
end
