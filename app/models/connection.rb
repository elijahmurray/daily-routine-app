class Connection < ActiveRecord::Base
  has_many :meetings
  def name
    first_name + " " +  last_name
  end
end
