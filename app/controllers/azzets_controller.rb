class AzzetsController < ApplicationController
  before_action :authenticate_admin!,:except => [:total_trades]
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

    respond_to do |format|
      if @azzet.save
        format.html { redirect_to '/azzets' }
        format.json { render :show, status: :ok, location: @azzet }
      else
        format.html { render :edit }
        format.json { render json: @azzet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @azzet.update(broker_params)
        format.html { redirect_to '/azzets' }
        format.json { render :show, status: :ok, location: @azzet }
      else
        format.html { render :edit }
        format.json { render json: @azzet.errors, status: :unprocessable_entity }
      end
    end
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
