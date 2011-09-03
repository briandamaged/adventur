class RenameImagesColumn < ActiveRecord::Migration
  def self.up
    rename_column :scenes, :image, :image_path
  end

  def self.down
    rename_column :scenes, :image_path, :image
  end
end
