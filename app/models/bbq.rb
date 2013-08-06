class Bbq < Meetup
  def title
    @attributes[:title] || "BBQ.rb ##{@number}"
  end
end
