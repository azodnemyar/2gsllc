class MachineMetasController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
    @machine_meta = MachineMeta.find(params[:id])
    if @machine_meta.save
      flash[:success] = "Equipment part updated successfully."
      redirect_to :back
    end
  end

  def destroy
  end
  
  def delete
    @delete_machine = MachineMeta.where(id: params[:machine_meta_ids]).delete_all
    if @delete_machine
      flash[:success] = "Equipment part was successfully deleted."
      redirect_to :back
    end
  end
end
