class AddFieldsToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :full_name, :string
    add_column :customers, :company_name, :string
    add_column :customers, :function, :string
    add_column :customers, :phone, :string
    add_column :customers, :address, :string
    add_column :customers, :city, :string
    add_column :customers, :country, :string
  end
end
