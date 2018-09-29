class Teklif < ApplicationRecord
  belongs_to :eczane
  has_many :alims

  validates_presence_of :barcode,
                        :alim_miktari,
                        :mal_fazlasi,
                        :min_alim,
                        :hedeflenen_alim,
                        :baslangic_tarihi,
                        :bitis_tarihi ,
                        :son_kul_tarihi,
                        :etiket_fiyati,
                        :depo_fiyati,
                        :net_fiyat ,
                        :eczane

  def as_json(_options={})
    {
        id: id,
        barcode: barcode,
        alim_miktari: alim_miktari,
        mal_fazlasi: mal_fazlasi,
        min_alim: min_alim,
        hedeflenen_alim: hedeflenen_alim,
        baslangic_tarihi: baslangic_tarihi,
        bitis_tarihi: bitis_tarihi,
        son_kul_tarihi: son_kul_tarihi,
        etiket_fiyati: etiket_fiyati,
        depo_fiyati: depo_fiyati,
        net_fiyat: net_fiyat,
        hedeflenen_alim_gecilsin: hedeflenen_alim_gecilsin,
        eczaneye_ozel: eczaneye_ozel,
        ozel_eczane_id: ozel_eczane_id,
        alinmis_miktar: alinmis_miktar,
        yemek_ceki_elden_nakit: yemek_ceki_elden_nakit,
        ekstra_urun: ekstra_urun,
        created_at: created_at,
        eczane: eczane
    }

  end

end
