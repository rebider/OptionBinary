class Strategy < ActiveRecord::Base
  attr_accessible :Name, :Type, :User_id
  belongs_to :User
end
