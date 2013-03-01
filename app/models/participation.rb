class Participation < ActiveRecord::Base
  validates_uniqueness_of :member_id, scope: :meetup_number

  belongs_to :member
end
