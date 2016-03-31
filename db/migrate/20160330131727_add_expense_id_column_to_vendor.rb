class AddExpenseIdColumnToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :expense_id, :integer
  end
end
