class BakiyesController < ApplicationController

  def index
    bakiyeler = Bakiye.joins(:eczane).group(:ad).sum(:tutar).to_a
    render json: { status: 'ok', bakiyeler: bakiyeler}
  end
  def create
    bakiye = Bakiye.create(bakiye_params)
    if bakiye.persisted?
      render json: { status: 'ok'}
    else
      render json: { status: 'error'}
    end
  end


  private
  def bakiye_params
    params.require(:bakiye).permit(:tutar, :eczane_id)
  end
end