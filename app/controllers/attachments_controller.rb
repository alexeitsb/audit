class AttachmentsController < ApplicationController
  load_and_authorize_resource :entry
  load_and_authorize_resource :attachment, through: :entry, shallow: true

  def index
    @attachments = @entry.attachments
    @attachment = Attachment.new
  end

  def new
  end

  def create
    @attachment = @entry.attachments.new(attachment_params)
    if @attachment.save
      redirect_to entry_attachments_path
    else
      render :new
    end
  end

  def destroy
    entry = @attachment.entry
    @attachment.destroy
    redirect_to entry_attachments_path(entry), notice: "O arquivo foi excluído com sucesso!"
  end


  private

  def attachment_params
    params.require(:attachment).permit(:file)
  end
end
