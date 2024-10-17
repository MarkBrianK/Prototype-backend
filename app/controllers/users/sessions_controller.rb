# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController

  def create
    # Find user by email
    resource = User.find_by(email: params[:email])

    # Check if user exists and password is correct
    if resource&.valid_password?(params[:password])
      sign_in(resource_name, resource)
      # Respond with a success message and user details
      render json: { success: true, message: 'Logged in successfully.', user: resource }, status: :ok
    else
      # Respond with an error if email or password is invalid
      render json: { success: false, message: 'Invalid email or password.' }, status: :unauthorized
    end
  end
end
