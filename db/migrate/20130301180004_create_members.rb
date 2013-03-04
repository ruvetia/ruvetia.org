class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :github_id
      t.string :github_login
      t.string :github_oauth_token

      t.timestamps
    end
  end
end
