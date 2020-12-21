class Wine < ActiveRecord::Base

   belongs_to :user
   belongs_to :wine_type

   validates :name, :year, :varietal, :quantity, :wine_type_id, presence: true 

end 