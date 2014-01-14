class StaticPagesController < ApplicationController
  before_action :signed_in_user
  
  def home
  end
  
  def time
    @employees = Employee.all
    @timesheet = Timesheet.new
  end
end
