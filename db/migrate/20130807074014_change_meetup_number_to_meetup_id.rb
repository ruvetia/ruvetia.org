class ChangeMeetupNumberToMeetupId < ActiveRecord::Migration
  def change
    rename_column :participations, :meetup_number, :meetup_id
  end
end
