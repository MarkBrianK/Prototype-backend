class CreateMeetings < ActiveRecord::Migration[7.1]
  def change
    create_table :meetings do |t|
      t.string :description
      t.string :string
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
