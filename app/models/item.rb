class Item < ActiveRecord::Base

  has_attached_file :image, :styles => { :examine => "400x400>", :thumb => "100x100>" }

  validates_presence_of :name, :description
end
