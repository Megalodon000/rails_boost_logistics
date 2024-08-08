class AddApprovedToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :approved, :boolean
  end
end
