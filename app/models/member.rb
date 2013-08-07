class Member < ActiveRecord::Base

  has_many :participations

  validates :name, presence: true

  def attend(meetup_id)
    participations.create! meetup_id: meetup_id
  rescue ActiveRecord::RecordInvalid
    # nothing happens if you are already attending
  end

  def cancel(meetup_id)
    participations.where(meetup_id: meetup_id).first.destroy
  end

  def attends?(meetup_id)
    participations.pluck(:meetup_id).include? meetup_id.to_i
  end

  def self.find_by_github_id(github_id)
    Member.where(github_id: github_id).first
  end

  def self.from_github_data(token, data)
    user = find_by_github_id(data["id"])
    user ||= Member.create!(name: data.fetch("name", data["login"]),
                            email: data["email"],
                            github_id: data["id"],
                            github_login: data["login"],
                            github_oauth_token: token)
    user
  end
end
