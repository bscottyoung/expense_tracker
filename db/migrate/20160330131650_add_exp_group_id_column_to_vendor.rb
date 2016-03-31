class AddExpGroupIdColumnToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :exp_group_id, :integer
  end
end
