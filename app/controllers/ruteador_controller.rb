class RuteadorController < ApplicationController
  def index
  	if user_signed_in?
  		redirect_to welcome_path
  	end
  	if admin_signed_in?
  		redirect_to brokers_path
  	end
  end
end
