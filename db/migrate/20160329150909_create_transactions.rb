class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :amt
      t.string :desc
      t.date :tdate
      t.integer :expense_id
      t.integer :exp_group_id
      t.integer :vendor_id
      t.boolean :taxable_flag

      t.timestamps null: false
    end
  end
end
