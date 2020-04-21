class AddColumnsToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :category_id, :string, :references => :category
  end
end
