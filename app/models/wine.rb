class Wine < ActiveRecord::Base

   belongs_to :user
   belongs_to :wine_type

   validates :name, :year, :varietal, :rating, presence: true 

end 