class AssignmentsController < ApplicationController
  def create
    @assignment = Assignment.new(assignment_params)
    if @assignment.save
      flash[:success] = "Added Successfully!"
      redirect_to :back
    else
      redirect_to :back
      flash[:notice] = "Unable to Save Update"
    end
  end
  
  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update_attributes(assignment_params)
      flash[:success] = "Updated Successfully!"
      redirect_to :back
    else
      redirect_to :back
    end
  end
  
  def destroy
    Assignment.find(params[:id]).destroy
    flash[:success] = "Assignment deleted."
    redirect_to :back
  end
  
private
  def assignment_params
    params.require(:assignment).permit(:workday_id, :date, :hours, :job_id, :employee_id, :timesheet_id)
  end
end
