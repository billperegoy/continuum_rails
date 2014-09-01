class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :project
      t.string :git_hash

      t.timestamps
    end
  end
end
