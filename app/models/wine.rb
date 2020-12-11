class Wine < ActiveRecord::Base

   belongs_to :user

   validates :name, :year, :varietal, :wine_style, presence: true 
 

end 