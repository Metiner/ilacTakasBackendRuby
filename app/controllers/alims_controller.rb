class AlimsController < ApplicationController

  def index
    eczane = Eczane.find(params[:eczane_id])
    render json: { status: "ok", alims: eczane.alims.sort{|m,n| n.created_at <=> m.created_at} }
  end
  def create
    alim = Alim.create(alim_params)
    increase_alinan_miktar_of_teklif
    render json: { status: "ok", alim: alim}
  end

  private
  def alim_params
    params.require(:alim).permit(:eczane_id,:miktar,:teklif_id,:tarih)
  end

  def increase_alinan_miktar_of_teklif
    miktar = params[:alim][:miktar]
    teklif = Teklif.find(params[:alim][:teklif_id])
    teklif.alinmis_miktar += miktar
    teklif.save
  end
end