class VideoCallsController < ApplicationController
  def create
    user_id = params[:user_id]
    token = generate_twilio_token(user_id)
    render json: { token: token }
  end

  private

  def generate_twilio_token(user_id)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    api_key = ENV['TWILIO_API_KEY']
    api_secret = ENV['TWILIO_API_SECRET']

    video_grant = Twilio::JWT::AccessToken::VideoGrant.new

    token = Twilio::JWT::AccessToken.new(
      account_sid,
      api_key,
      api_secret,
      [video_grant]
    )


    token.identity = user_id

    
    token.to_jwt
  end
end
