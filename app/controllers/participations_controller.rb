class ParticipationsController < ApplicationController

  def create
    current_user.attend(params[:meetup])
    redirect_to root_path
  end

  def destroy
    current_user.cancel(params[:meetup])
    redirect_to root_path
  end

end
