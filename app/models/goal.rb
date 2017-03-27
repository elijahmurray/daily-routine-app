class Goal < ActiveRecord::Base
  belongs_to :user
  DURATIONS_IN_MONTHS = {1 => "1 Month",
                         3 => "3 Months",
                         6 => "6 Months",
                         12 => "1 Year",
                         24 => "2 Years",
                         36 => "3 Years",
                         60 => "5 Years",
                         120 => "10 Years"}
  CATEGORIES = %w(Personal Professional Relationships)

  validates :name, presence:true
  validates :duration, presence:true
  validates :category, presence:true

  def due_date
    self.created_at + duration.months
  end
end
