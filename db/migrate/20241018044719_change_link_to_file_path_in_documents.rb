class ChangeLinkToFilePathInDocuments < ActiveRecord::Migration[7.1]
  def change
    rename_column :documents, :link, :file_path
  end
end
