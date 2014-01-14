class Workday < ActiveRecord::Base
  belongs_to :employee
  belongs_to :timesheet
  has_many :assignments, dependent: :destroy
  
  accepts_nested_attributes_for :assignments, :allow_destroy => true
  
  def self.active(timesheet)
    where("workdays.timesheet_id = ?", timesheet.id)
  end
  
end
