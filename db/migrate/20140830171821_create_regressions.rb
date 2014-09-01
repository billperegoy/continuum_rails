class CreateRegressions < ActiveRecord::Migration
  def change
    create_table :regressions do |t|
      t.string :name
      t.references :stage, index: true
      t.references :release, index: true

      t.timestamps
    end
  end
end
