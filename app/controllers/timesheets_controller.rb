class TimesheetsController < ApplicationController
  
  def index
    @employees = Employee.where(status: true)
    @timesheets = Timesheet.all.order("startdate DESC")
    @timesheet = Timesheet.new
    @workday = Workday.new
    @timesheet.workdays.build
    
    last_timesheet = Timesheet.last
    filter_date = Date.today
    if last_timesheet
      filter_date = last_timesheet.startdate.next_week
    end
    bow = filter_date.beginning_of_week.strftime("%B %e, %Y")
    eow = filter_date.end_of_week.strftime("%B %e, %Y")
    
    @timesheet.startdate  = bow
    @timesheet.enddate    = eow
  end
  
  def create
    @timesheet = Timesheet.new(timesheet_params)
    if @timesheet.save
      flash[:success] = "Added New TimeSheet Successfully!"
      redirect_to :back
    else
      redirect_to employee_path
    end
  end
  
  def show
    @timesheet = Timesheet.find(params[:id])
    @employees = Employee.all
    @assignment = Assignment.new
    @job = Job.new
  end
  
  def current
    @bow = Time.zone.now.beginning_of_week
    @eow = Time.zone.now.end_of_week
    
    @timesheet = Timesheet.find(:first, :conditions => ['timesheets.startdate = ?', @bow])
    if @timesheet
      redirect_to timesheet_path(@timesheet)
    else
      redirect_to timesheets_path
    end
  end
  
  def edit
    @timesheet = Timesheet.find(params[:id])
    @startdate = @timesheet.startdate.strftime("%B %e, %Y")
    
    @employee = Employee.find(@timesheet.employee_id)
  end
  
  def destroy
    Timesheet.find(params[:id]).destroy
    flash[:success] = "TimeSheet deleted."
    redirect_to :back
  end
  
  def delete
    Timesheet.where(id: params[:timesheet_ids]).delete_all
    flash[:success] = "Timesheet successfully deleted."
    redirect_to timesheets_path
  end
  
private
  def timesheet_params
    params.require(:timesheet).permit(:employee_id, :startdate, :enddate, workdays_attributes: [:employee_id, :date, :timesheet_id])
  end
end
