class Scene < ActiveRecord::Base
  attr_accessor         :image

  before_save           :save_image
  
  validates_presence_of :name, :description
  validates_presence_of :image, :on => :create




  private
  
  def save_image()
    if self.image.present?
      self.image_path = File.join("public", "data", "images", @image.original_filename)
      File.open(self.image_path, "wb") {|f| f.write(@image.read) }
    end
  end

end
