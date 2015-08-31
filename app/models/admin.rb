class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessible :email, :password, :encrypted_password
  devise :database_authenticatable, :trackable, :timeoutable, :lockable 

end
