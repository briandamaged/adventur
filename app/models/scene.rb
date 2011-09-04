class Scene < ActiveRecord::Base
  validates_presence_of :name, :description

  has_attached_file :image, :styles => { :in_game => "400x400>", :thumb => "100x100>" }

end
