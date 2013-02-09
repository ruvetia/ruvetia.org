class ApplicationController < ActionController::Base
  protect_from_forgery

  def ruvetia_team
    $team
  end
  private :ruvetia_team
  helper_method :ruvetia_team
end
