class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_setting, only: [:edit, :update, :destroy]

  respond_to :html
  respond_to :json

  def index
    @settings = Setting.user_settings(current_user.id)
    respond_with(@settings)
  end

  def show
    respond_with(@setting)
  end

  def update

    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to '/settings'}
        format.json { render :show, status: :created, location: @setting }
      else
        format.html { render :new }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @setting.destroy
    respond_with(@setting)
  end

  def user_settings
    render :json => @setting = Setting.user_settings(current_user.id)
  end

  private
     
    def set_setting  
        @setting = Setting.find(params[:id])
    end

    def setting_params
      params.require(:setting).permit(:user_id, :MaximumTradesPerDay, :MaximumPercentPerTrade, :MaximumPercentLossPerDay, :DailyGoalPercent)
    end
end
