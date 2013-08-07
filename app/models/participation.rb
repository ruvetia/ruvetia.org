class Participation < ActiveRecord::Base
  validates :member, presence: true
  validates :meetup_id, presence: true
  validates_uniqueness_of :member_id, scope: :meetup_id

  belongs_to :member
end
