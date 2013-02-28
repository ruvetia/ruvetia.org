class Meetup

  attr_reader :city, :time, :location

  def initialize(attributes = {})
    @city = attributes[:city]
    @location = attributes.fetch(:location, '<<to be announced>>')
    @time = attributes[:time].to_time if attributes[:time]
  end

  def title
    "%s: %s" % [@city, @time.strftime('%d. %B, %H:%M Uhr')]
  end

end
