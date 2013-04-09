class PagesController < ApplicationController

  def home
    @title = "Home"
  end

  def team
    @title = "Team"
  end

  def events
    @title = "Upcoming and past events"
  end

end
