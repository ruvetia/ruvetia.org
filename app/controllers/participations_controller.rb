class ParticipationsController < ApplicationController

  def index
    @meetup = $meetups.detect {|m| m.id == params[:meetup].to_i}
    attendees = @meetup.participants.map {|p|
      { "name" => p.name,
        "github" => p.github_login}
    }
    render json: JSON.pretty_generate(attendees)
  end

  def create
    current_user.attend(params[:meetup])
    redirect_to root_path
  end

  def destroy
    current_user.cancel(params[:meetup])
    redirect_to root_path
  end

end
