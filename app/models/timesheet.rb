class Timesheet < ActiveRecord::Base
  belongs_to :employee
  has_many :employees, through: :workdays
  has_many :workdays, dependent: :destroy
  
  accepts_nested_attributes_for :workdays, :allow_destroy => true
  
  def after_initialize
    if self.startdate.blank? || self.enddate.blank?
      set_start_and_end_dates
    end
  end
  
  def date_range(startdate, enddate)
    day = self.startdate
    dates = Array.new
    while day <= self.enddate do
      dates << day.to_date
      day = day.tomorrow
    end
    dates
  end
  
  def total_work_hours
    if self.workdays
      hours = self.assignments.sum(:hours)
    else
      hours = 0
    end
    hours
  end
  
private
  def set_start_and_end_dates
    if self.last?
      filter_date = last_timesheet.startdate.next_week
    else
      filter_date = Date.today
    end
    self.timesheet.startdate = filter_date.beginning_of_week
    self.timesheet.enddate = filter_date.end_of_week
  end
end
