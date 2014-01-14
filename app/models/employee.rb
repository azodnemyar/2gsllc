class Employee < ActiveRecord::Base
  has_many :workdays
  has_many :timesheets, through: :workdays
  has_many :assignments
  
  def full_name
    "#{first_name} #{last_name}"
  end 

  
end
