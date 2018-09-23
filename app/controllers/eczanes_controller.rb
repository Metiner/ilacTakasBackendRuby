class EczanesController < ApplicationController
  def index
    @eczanes = Eczane.all
    render json: { eczaneler: @eczanes }
  end

  def show
    eczane = Eczane.find(params[:id])
    render json: eczane
  end
end
