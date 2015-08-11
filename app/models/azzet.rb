class Azzet < ActiveRecord::Base
	attr_accessible :Type, :Name

  def self.get_azzets

  	azzets = Azzet.order(:Name)

  end
end
