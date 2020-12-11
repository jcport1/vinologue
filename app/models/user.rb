class User < ActiveRecord::Base

    has_secure_password #validates password built-in
    has_many :wines

    validates :user_name, :email, presence: true 
    validates :email, uniqueness: true 
   
end 