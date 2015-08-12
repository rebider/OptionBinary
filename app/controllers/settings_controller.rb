class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_setting, only: [:show, :edit, :update, :destroy]
  before_action :get_setting, only: [:user_settings]
  
  respond_to :html
  respond_to :json

  def index
    @settings = Setting.user_settings(current_user.id)
    respond_with(@settings)
  end

  def show
    respond_with(@setting)
  end

  def new
    @setting = Setting.new
    respond_with(@setting)
  end

  def edit
  end

  def create
    @setting = Setting.new(setting_params)
    @setting.save
    respond_with(@setting)
  end

  def update
    @setting.update(setting_params)
    respond_with(@setting)
  end

  def destroy
    @setting.destroy
    respond_with(@setting)
  end

  def user_settings
    
    respond_to do |format|
       format.json do 
        render :json => Setting.user_settings(current_user.id)
      end
     end
  end

  private
    def set_setting
      @setting = Setting.find(params[:id])
    end

    def get_setting
      Setting.user_settings(current_user.id)
    end

    def setting_params
      params.require(:setting).permit(:user_id, :MaximumTradesPerDay, :MaximumPercentPerTrade, :MaximumPercentLossPerDay)
    end
end
