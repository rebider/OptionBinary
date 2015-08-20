class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_setting, only: [:edit, :update, :destroy]
  before_action :set_setting_json, only: [:show]
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
    respond_to do |format|
      if @setting.save
        format.html { redirect_to '/settings'}
        format.json { render :show, status: :created, location: @setting }
      else
        format.html { render :new }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
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
    render :json => @setting = Setting.where(:user_id => current_user.id)
  end

  private
     
    def set_setting  
        @setting = Setting.find(params[:id])
    end
    def set_setting_json  
        render :json => @setting = Setting.where(:user_id => current_user.id)
    end
    def get_setting
      Setting.user_settings(current_user.id)
    end

    def setting_params
      params.require(:setting).permit(:user_id, :MaximumTradesPerDay, :MaximumPercentPerTrade, :MaximumPercentLossPerDay)
    end
end
