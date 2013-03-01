class Member < ActiveRecord::Base

  has_many :participations

  validates :name, presence: true

  def attend(meetup_number)
    participations.create! meetup_number: meetup_number
  rescue ActiveRecord::RecordInvalid
    # nothing happens if you are already attending
  end

  def attends?(meetup_number)
    participations.pluck(:meetup_number).include? meetup_number.to_i
  end

  def self.find_by_github_id(github_id)
    Member.where(github_id: github_id).first
  end

  def self.from_github_data(token, data)
    user = find_by_github_id(data["id"])
    user ||= Member.create!(name: data["name"],
                            email: data["email"],
                            github_id: data["id"],
                            github_login: data["login"],
                            github_oauth_token: token)
    user
  end
end
