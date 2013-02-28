class Meetup

  attr_reader :city, :time, :location

  def initialize(attributes = {})
    @title = attributes[:title]
    @city = attributes[:city]
    @location = attributes.fetch(:location, 'Raeuberbar')
    @time = attributes[:time].to_time if attributes[:time]
    @map_src = attributes[:map_src]
  end

  def title
    @title
  end

  def city
    @city
  end

  def date
    @time.strftime('%d. %B, %H:%M Uhr')
  end

  def map_src
    @map_src
  end
end
