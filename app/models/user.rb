class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessible :email, :password, :remember_me
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
     :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
  	  email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      #email = auth.info.email if email_is_verified
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        #user.email = auth.info.email
        #user.email= auth.info.email if email_is_verified
        user.name = auth.info.name
        user.avatar = auth.info.image
        user.password = Devise.friendly_token[0,20]
      end
  end


end
