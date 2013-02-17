class Team

  def member(nick)
    members.detect { |m| m.nick == nick }
  end

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
