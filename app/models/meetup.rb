class Meetup

  attr_reader :id, :number, :title, :city, :time, :location, :map_src

  def initialize(attributes = {})
    @attributes = attributes
    @id = attributes[:id]
    @number = attributes[:number]
    @city = attributes[:city]
    @location = attributes.fetch(:location, 'TBA')
    @time = attributes[:time].to_time if attributes[:time]
    @map_src = attributes[:map_src]
  end

  def title
    @attributes[:title] || "Ruvetia ##{@number}"
  end

  def date
    @time.strftime('%d. %B, %H:%M Uhr')
  end

  def participants
    Member.joins(:participations).
      select('members.*, participations.created_at').
      where('meetup_id = ?', @id).
      uniq.
      order('participations.created_at')
  end
end
