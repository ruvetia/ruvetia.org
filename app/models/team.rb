class Team

  def members
    @members ||= []
  end

  def <<(member)
    members << member
  end

  def each(&block)
    members.each(&block)
  end

end
