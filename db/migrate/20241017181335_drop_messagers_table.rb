class DropMessagersTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :messagers
  end

  def down
    create_table :messagers do |t|
      t.string :message
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
