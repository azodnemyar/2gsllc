class AttachmentsController < ApplicationController
  
  def destroy
    Attachment.find(params[:id]).destroy
    flash[:success] = "Attachment deleted."
    redirect_to :back
  end
  
private
  def attachment_params
    params.require(:attachment).permit(:file)
  end
end
