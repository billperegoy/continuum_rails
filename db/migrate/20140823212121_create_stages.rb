class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.string :name
      t.integer :level
      t.string :command
      t.references :project, index: true

      t.timestamps
    end
  end
end
