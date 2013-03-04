class ApplicationController < ActionController::Base
  protect_from_forgery

  def login(member)
    session[:user_id] = member.github_id
  end
  private :login

  def signed_in?
    !!current_user
  end
  private :signed_in?
  helper_method :signed_in?

  def current_user
    Member.find_by_github_id(session[:user_id])
  end
  private :current_user
  helper_method :current_user

  def ruvetia_meetups
    $meetups
  end
  private :ruvetia_meetups
  helper_method :ruvetia_meetups

  def ruvetia_team
    $team
  end
  private :ruvetia_team
  helper_method :ruvetia_team
end
