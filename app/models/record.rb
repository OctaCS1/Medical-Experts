class Record < ApplicationRecord
  belongs_to :patient

  validates :judet_spital, presence: true
  validates :localitate_spital, presence: true
  validates :spital, presence: true
  validates :sectia, presence: true
  validates :internat_urgenta, presence: true
  validates :data_internarii, presence: true
  validates :ora_internarii, presence: true
  validates :data_externarii, presence: true
  validates :ora_externarii, presence: true
  validates :numar_zile_spitalizare, presence: true
  validates :numar_zile_concediu, presence: true
  validates :diagnostic_de_trimitere, presence: true
  validates :diagnostic_la_internare, presence: true
  validates :diagnostic_la_72_ore, presence: true
  validates :diagnostic_externare_principal, presence: true
  validates :diagnostic_externare_boli, presence: true
  validates :interventie_tehnica, presence: true
  validates :interventie_boala, presence: true
  validates :interventie_data, presence: true
  validates :stare_la_externare, presence: true
  validates :diagnostic_anatomo_patologic, presence: true
  validates :observatie_clinica, presence: true
  validates :observatie_data, presence: true
  validates :examinari_de_specialitate, presence: true
  validates :examene_cerute, presence: true
end
