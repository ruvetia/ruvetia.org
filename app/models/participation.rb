class Participation < ActiveRecord::Base
  validates :member, presence: true
  validates :meetup_number, presence: true
  validates_uniqueness_of :member_id, scope: :meetup_number

  belongs_to :member
end
