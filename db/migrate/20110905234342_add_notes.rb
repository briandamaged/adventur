class AddNotes < ActiveRecord::Migration
  def self.up
    add_column :scenes, :notes,    :text
    add_column :items,  :notes,    :text
  end

  def self.down
    remove_column :items,  :notes
    remove_column :scenes, :notes
  end
end
