class TasksController < ApplicationController
  before_filter :load_taskable
  
  
  def new
    @task = Task.new
  end
  
  def create
    @task = @taskable.tasks.create!(task_params)
    respond_to do |format|
      format.html { redirect_to @taskable }
      format.js
    end
  end
  
  def complete
    @task = @taskable.tasks.find(params[:id])
    @task.completed = true
    if @task.save
      redirect_to @taskable, notice: "Task Completed."
    else
      render :new
    end
  end
  
  def active
    @task = @taskable.tasks.find(params[:id])
    @task.completed = false
    if @task.save
      redirect_to @taskable, notice: "Task Restored."
    else
      render :new
    end
  end
  
  def update 
    @task = Task.find(params[:id])
    @task.update_attributes!(task_params)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
  
  def destroy
    @task = Task.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
  
private
  def task_params
    params.require(:task).permit(:name, :due_date, :completed, :user_id, :completed_by)
  end
  
  def load_taskable
    resource, id = request.path.split('/')[1, 2]
    @taskable = resource.singularize.classify.constantize.find(id)
  end
  
end