class Alim < ApplicationRecord
  belongs_to :teklif
  belongs_to :eczane
  has_many :ilacs
  validates_presence_of :miktar, :teklif, :eczane

  def as_json(_options = {})
    {
        id:id,
        miktar: miktar,
        gonderildi: gonderildi,
        teslim_alindi: teslim_alindi,
        teklif: teklif,
        created_at: created_at,
        eczane: eczane,
        karekodlar: karekodlar
    }
  end
end

