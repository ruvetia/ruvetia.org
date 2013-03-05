class Meetup

  attr_reader :number, :title, :city, :time, :location, :map_src

  def initialize(attributes = {})
    @number = attributes[:number]
    @title = attributes[:title] || "Ruvetia ##{@number}"
    @city = attributes[:city]
    @location = attributes.fetch(:location, 'TBA')
    @time = attributes[:time].to_time if attributes[:time]
    @map_src = attributes[:map_src]
  end

  def date
    @time.strftime('%d. %B, %H:%M Uhr')
  end

  def participants
    Member.joins(:participations).
      select('members.*, participations.created_at').
      where('meetup_number = ?', @number).
      uniq.
      order('participations.created_at')
  end
end
