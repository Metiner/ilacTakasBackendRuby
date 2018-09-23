class TeklifsController < ApplicationController
  def index
    @teklifs = Teklif.all
    render json: { teklifler: @teklifs }
  end

  def get_ilac_auto_complete
    ilaclarJsonFile = File.read(Rails.root + 'db/ilaclar.json')
    ilaclar = JSON.parse(ilaclarJsonFile)
    ilaclar = ilaclar['ilaclar'].select { |ilac| ilac['ILAC ADI'].include? params[:searchParam]}
    render json: { ilaclar: ilaclar }
  end

  def create
    teklif = Teklif.create(teklif_params)
  end

  private
  def teklif_params
    params.require(:teklif).permit!
  end
end