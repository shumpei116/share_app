class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def display_image(height,width)
    image.variant(resize: "#{height}x#{width}")
  end
end
