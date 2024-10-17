class CreateMessagers < ActiveRecord::Migration[7.1]
  def change
    create_table :messagers do |t|
      t.string :message
      t.string :string
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
