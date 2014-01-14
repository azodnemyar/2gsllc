class WorkdaysController < ApplicationController
  def create
    @workday = Workday.new(workday_params)
    if @workday.save
      flash[:success] = "Workday Added Successfully!"
      redirect_to :back
    end
  end
  
private
  def workday_params
    params.require(:workday).permit(:employee_id, :timesheet_id, :date, assignments_attributes: [:id, :workday_id, :date, :hours, :job_id, :employee_id, :timesheet_id])
  end
end
