class MessagersController < ApplicationController
  def index
    @message = Messager.all
    render json: @message
  end
end
