class ScenesUsePaperclip < ActiveRecord::Migration
  def self.up
    remove_column :scenes, :image_path
    
    add_column :scenes, :image_file_name,    :string
    add_column :scenes, :image_content_type, :string
    add_column :scenes, :image_file_size,    :integer
    add_column :scenes, :image_updated_at,   :datetime
  end

  def self.down
    remove_column :scenes, :image_file_name
    remove_column :scenes, :image_content_type
    remove_column :scenes, :image_file_size
    remove_column :scenes, :image_updated_at
    
    add_column :scenes, :image_path, :string
  end
end
