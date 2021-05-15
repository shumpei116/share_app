class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def display_image(height,width)
    if self.image.attached?
      image.variant(resize: "#{height}x#{width}")
    else 
     image_tag("cover_top.jpg", size: '200x300') 
    end 
    # image.variant(resize: "#{height}x#{width}")
  end
end
