class User < ActiveRecord::Base

    has_secure_password
    has_many :wines

    validates :user_name, :email, :password, presence: true 
   
end 