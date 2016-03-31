class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :exp_group_id

      t.timestamps null: false
    end
  end
end
