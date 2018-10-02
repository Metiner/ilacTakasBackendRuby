class Eczane < ApplicationRecord
  belongs_to :grup
  has_many :teklifs
  has_many :alims
  has_one :user
  has_many :bakiyes
  validates_presence_of :ad, :gln_no
end
def as_json(_options = {})
  json = {
      id: id,
      ad: ad,
      gln_no: gln_no,
      bakiye: bakiye,
      actigi_teklif_sayisi: actigi_teklif_sayisi,
      created_at: created_at
  }
end