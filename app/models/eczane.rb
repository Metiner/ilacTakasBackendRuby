class Eczane < ApplicationRecord
  belongs_to :grup
  has_many :teklifs
  has_many :alims
  has_one :user
end
