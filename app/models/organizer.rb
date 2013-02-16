class Organizer

  attr_reader :name, :bio, :social_media

  def initialize(name, attributes = {})
    @name = name
    @bio = attributes[:bio]
    @social_media = attributes[:social_media]
    @gravatar_hash = attributes[:gravatar_hash]
  end

  def image_url
    "http://www.gravatar.com/avatar/%s?s=%s" % [@gravatar_hash, image_size]
  end

  def image_size
    200
  end

end
