class ToolsController < ApplicationController

	respond_to :html, :json

	def show
		respond_with(@trade)
	end

	 def index

  	end
end
