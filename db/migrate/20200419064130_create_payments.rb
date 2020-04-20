class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :price
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :payments, [:user_id, :created_at]
  end
end
