class CreateExpGroups < ActiveRecord::Migration
  def change
    create_table :exp_groups do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
