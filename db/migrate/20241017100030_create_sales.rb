class CreateSales < ActiveRecord::Migration[7.1]
  def change
    create_table :sales do |t|
      t.date :sale_date
      t.integer :sale_amount
      t.integer :user_id

      t.timestamps
    end
  end
end
