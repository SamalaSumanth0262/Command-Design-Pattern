class UsersController < ApplicationController
  # bypass csrf protection for all the requests made
  protect_from_forgery with: :null_session
  before_action :set_user, only: %i[ show edit update destroy ]
  # /users/
  def create
   render json: ::Core::CreateUserCommand.new(user_params).run
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {})
    end
end
