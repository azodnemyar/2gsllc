class NotesController < ApplicationController
  def create
    @note = Note.new(note_params)
    if @note.save
      flash[:success] = "Note saved successfully."
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(note_params)
      flash[:success] = "Note updated successfully."
      redirect_to :back
    end
  end
  
  def destroy
    @note = Note.find(params[:id]).destroy
    flash[:success] = "Note deleted."
    redirect_to :back
  end
  
private
  def note_params
    params.require(:note).permit(:subject, :body, :machine_id, :user_id)
  end
end
