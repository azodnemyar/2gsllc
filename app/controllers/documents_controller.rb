class DocumentsController < ApplicationController
  def create
    @document = Document.new(document_params)
    if @document.save
      flash[:success] = "Document uploaded successfully."
      redirect_to :back
    else
      flash[:error] = "Oops! There was an error. Please try again."
      redirect_to :back
    end
  end

  def update
  end

  def destroy
    @document = Document.find(params[:id]).destroy
    flash[:success] = "Document deleted successfully."
    redirect_to :back
  end
  

private
  def document_params
    params.require(:document).permit(:pdf, :machine_id)
  end
end
