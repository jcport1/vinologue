class Wine < ActiveRecord::Base

   belongs_to :users
   
   validates :name, :year, :varietal, :wine_style, presence: true 
 

end 