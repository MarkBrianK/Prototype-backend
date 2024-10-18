class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :destroy]  # Only if you have a show or destroy action

  def index
    @documents = Document.all
    render json: @documents
  end
  def create
    @document = Document.new(user_id: params[:user_id])
    # Assuming you're using a file upload field called 'document'
    uploaded_file = params[:document]

    if uploaded_file.present?
      # Save the file locally and get the file path
      file_path = Rails.root.join("public", "uploads", uploaded_file.original_filename)
      File.open(file_path, 'wb') do |file|
        file.write(uploaded_file.read)
      end

      @document.file_path = "/uploads/#{uploaded_file.original_filename}" # Store the file path in the DB
    end

    if @document.save
      render json: @document, status: :created
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end


  def show
    render json: @document
  end

  def destroy
    @document.destroy
    head :no_content
  end

  private

  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:file, :user_id)
  end
end
