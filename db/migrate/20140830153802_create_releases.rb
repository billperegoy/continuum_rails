class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :git_id
      t.references :project, index: true

      t.timestamps
    end
  end
end
