class AzzetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_azzet, only: [:show, :edit, :update, :destroy, :total_trades]

  respond_to :html

  def index
    @azzets = Azzet.all
    respond_with(@azzets)
  end

  def show
    respond_with(@azzet)
  end

  def new
    @azzet = Azzet.new
    respond_with(@azzet)
  end

  def edit
  end

  def create
    @azzet = Azzet.new(azzet_params)
    @azzet.save
    respond_with(@azzet)
  end

  def update
    @azzet.update(azzet_params)
    respond_with(@azzet)
  end

  def destroy
    @azzet.destroy
    respond_with(@azzet)
  end

  def total_trades
    respond_to do |format|
       format.json do 
        render :json => Trade.total_trades_by_azzet(params[:id], current_user.id)
      end
     end
  end

  private
    def set_azzet
      @azzet = Azzet.find(params[:id])
    end

    def azzet_params
      params.require(:azzet).permit(:Type, :Name)
    end
end
