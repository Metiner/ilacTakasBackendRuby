class Alim < ApplicationRecord
  belongs_to :teklif
  belongs_to :eczane
  has_many :karekods
end
