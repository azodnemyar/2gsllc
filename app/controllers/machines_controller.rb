class MachinesController < ApplicationController
  before_action :signed_in_user
  
  def index
    @machines = Machine.all
    @machine = Machine.new
    @machine.attachments.build
  end

  def new
    @machine = Machine.new
    @machine.attachments.build
    @machine.machine_metas.build.build_attachment
  end

  def show
    @machine  = Machine.find(params[:id])
    @new_machine_meta = MachineMeta.new
    @metas    = @machine.machine_metas
    @taskable = @machine
    @tasks    = @taskable.tasks.order(:due_date => :asc)
    @task     = Task.new
    @completed_tasks = @tasks.where(completed: true)  
    @note     = Note.new
    @notes    = @machine.notes
    @document = Document.new
    @documents = @machine.documents
  end

  def create
    @machine= Machine.new(machine_params)
    if @machine.save
      flash[:success] = "Added New Equipment Successfully!"
      redirect_to machines_path
    else
      render 'index'
    end
  end

  def destroy
    Machine.find(params[:id]).destroy
    flash[:success] = "Equipment deleted."
    redirect_to machines_url
  end
  
  def edit
    @machine = Machine.find(params[:id])
    @machine.attachments.build
    @machine.machine_metas.build.build_attachment
  end
  
  def update
    @machine = Machine.find(params[:id])
    if @machine.update_attributes(machine_params)
      MachineMeta.where(id: params[:machine_meta_ids]).delete_all
      flash[:success] = "Equipment updated"
      redirect_to machine_path(@machine)
    else
      render 'edit'
    end    
  end
  
  def delete
    Machine.where(id: params[:machine_ids]).delete_all
    flash[:success] = "Equipment was successfully deleted."
    redirect_to machines_path
  end
  
  def clear_task_history
    Task.where(id: params[:task_ids]).delete_all
    flash[:success] = "Service history cleared successfully!"
    redirect_to :back
  end
  
private
  def machine_params
    params.require(:machine).permit(:make, :model, :value, :year, :serial, :status, machine_metas_attributes: [:id, :meta_value, :meta_key, :_destroy, attachment_attributes: [:id, :file]], attachments_attributes: [:id, :file])
  end
end
