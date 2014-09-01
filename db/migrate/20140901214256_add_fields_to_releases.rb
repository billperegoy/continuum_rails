class AddFieldsToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :commit_message, :string
    add_column :releases, :commit_timestamp, :datetime
    add_column :releases, :committer_name, :string
  end
end
