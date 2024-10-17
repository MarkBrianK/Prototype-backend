class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :link
      t.integer :user_id

      t.timestamps
    end
  end
end
