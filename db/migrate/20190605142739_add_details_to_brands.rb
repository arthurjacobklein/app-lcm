class AddDetailsToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :first_name, :string
    add_column :brands, :last_name, :string
    add_column :brands, :company_name, :string
    add_column :brands, :phone_number, :integer
    add_column :brands, :website, :string
  end
end
