class Strategy < ActiveRecord::Base
  attr_accessible :Name, :Type, :User_id
  belongs_to :User

  def self.user_strategies(userId)

  	strategies = where(:User_id => userId).order(:Name)

  end


end
