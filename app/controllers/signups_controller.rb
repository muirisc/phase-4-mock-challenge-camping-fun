class SignupsController < ApplicationController
  def create
    signup = Signup.new(signup_params)
    if signup.save
    render json: signup.activity, status: :created
    else
  # rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: signup.errors.full_messages}, status: :unprocessable_entity
  end
end


private

def signup_params
  params.permit(:time, :camper_id, :activity_id)
end


end
