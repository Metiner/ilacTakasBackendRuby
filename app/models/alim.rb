class Alim < ApplicationRecord
  belongs_to :teklif
  belongs_to :eczane
  has_many :karekods

  def as_json(_options = {})
    {
        id:id,
        miktar: miktar,
        gonderildi: gonderildi,
        teslim_alindi: teslim_alindi,
        teklif: teklif,
        created_at: created_at,
        eczane: eczane
    }
  end
end

