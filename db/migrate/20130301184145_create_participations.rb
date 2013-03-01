class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :meetup_number
      t.integer :member_id

      t.timestamps
    end
    add_index :participations, [:meetup_number, :member_id], unique: true
  end
end
