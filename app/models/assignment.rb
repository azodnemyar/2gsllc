class Assignment < ActiveRecord::Base
  validates :hours, presence: true
  
  def self.active(timesheet)
    where("assignments.timesheet_id = ?", timesheet.id)
  end
end
