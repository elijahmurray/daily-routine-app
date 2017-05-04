module ApplicationHelper
  def pretty_date(date)
    date.strftime("%b %e, %Y")
  end

  def render_html_text(text)
    (text).gsub(/\n/, '<br/>').html_safe
  end
end
