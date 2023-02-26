class Patient < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy

  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :data_nasterii, presence: true
  validates :varsta, numericality: true
  validates :sex, presence: true
  validates :cnp, length: {is: 13}, uniqueness: true
  validates :serie_nr_buletin, length: {is: 8}
  validates :localitate, presence: true
  validates :judet, presence: true
  validates :adresa, presence: true, length: {maximum: 100}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :greutate, numericality: true
  validates :inaltime, numericality: true
  validates :ocupatie, presence: true
end
