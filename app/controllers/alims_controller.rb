class AlimsController < ApplicationController

  def index
    eczane = Eczane.find(params[:eczane_id])
    render json: { status: "ok", alims: eczane.alims.sort{|m,n| n.created_at <=> m.created_at} }
  end
  def create
    alim = Alim.create(alim_params)
    if alim.persisted?
      increase_alinan_miktar_of_teklif
      render json: { status: "ok", alim: alim}
    else
      render json: { status: "error"}
    end
  end

  def get_gonderimlerim
    #gonderimlerim = Alim.find_by_sql("select a.* from alims a, teklifs b where a.teklif_id = b.id and b.eczane_id = #{params[:eczane_id]}")
    gonderimlerim = Alim.joins(:teklif).where('teklifs.eczane_id = ?', params[:eczane_id]).to_a
    render json: { status: "ok", gonderimlerim: gonderimlerim}
  end

  def update
    alim = Alim.find(params[:id])
    if alim.update(alim_params)
      render json: { status: "ok"}
    else
      render json: { status: "error"}
    end
  end

  private
  def alim_params
    params.require(:alim).permit!
  end

  def increase_alinan_miktar_of_teklif
    miktar = params[:alim][:miktar]
    teklif = Teklif.find(params[:alim][:teklif_id])
    teklif.alinmis_miktar += miktar
    teklif.save
  end

end