class ChangeGithubIdToInteger < ActiveRecord::Migration
  def up
    execute 'ALTER TABLE members ALTER COLUMN github_id TYPE integer USING CAST(github_id AS INTEGER)'
  end

  def down
    change_column :members, :github_id, :string
  end
end
