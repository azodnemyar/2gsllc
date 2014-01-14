class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    @date = Date.today.beginning_of_week
    @employee = Employee.new
  end
  
  def new
    @employee = Employee.new
  end
  
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:success] = "Added New Employee Successfully"
      redirect_to employees_path
    else
      render 'new'
    end
  end
  
  def show
    @employee = Employee.find(params[:id])
    @timesheet = Timesheet.new
    @workday = Workday.new
    @timesheet.workdays.build
    @assignment = Assignment.new
    
    last_timesheet = @employee.timesheets.last
    filter_date = Date.today
    if last_timesheet
      filter_date = last_timesheet.startdate.next_week
    end
    bow = filter_date.beginning_of_week.strftime("%B %e, %Y")
    eow = filter_date.end_of_week.strftime("%B %e, %Y")
    
    @timesheet.startdate  = bow
    @timesheet.enddate    = eow
  end
  
  def edit
    @employee = Employee.find(params[:id])
  end
  
  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(employee_params)
      flash[:success] = "Employee Updated Successfully"
      redirect_to employees_path
    else
      render employee_path(employee)
    end
  end
  
  def destroy
    Employee.find(params[:id]).destroy
    flash[:success] = "Employee deleted."
    redirect_to employees_url
  end
  
  def delete
    Employee.where(id: params[:employee_ids]).delete_all
    flash[:success] = "Employee successfully deleted."
    redirect_to employees_path
  end
  
private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :wage, :status)
  end
end
