class Scene < ActiveRecord::Base
  validates_presence_of :name, :description

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end
