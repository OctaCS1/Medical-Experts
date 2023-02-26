class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :judet_spital
      t.string :localitate_spital
      t.string :spital
      t.string :sectia
      t.boolean :internat_urgenta
      t.date :data_internarii
      t.time :ora_internarii
      t.date :data_externarii
      t.time :ora_externarii
      t.integer :numar_zile_spitalizare
      t.integer :numar_zile_concediu
      t.string :numar_talon_pensie
      t.text :diagnostic_de_trimitere
      t.text :diagnostic_la_internare
      t.text :diagnostic_la_72_ore
      t.text :diagnostic_externare_principal
      t.text :diagnostic_externare_boli
      t.text :interventie_tehnica
      t.text :interventie_boala
      t.date :interventie_data
      t.string :stare_la_externare
      t.text :decedat
      t.text :diagnostic_anatomo_patologic
      t.text :observatie_clinica
      t.date :observatie_data
      t.text :examinari_de_specialitate
      t.text :examene_cerute
      t.string :examen_oncologic_cavitate_bucala
      t.string :examen_oncologic_tegumente
      t.string :examen_oncologic_ganglionare
      t.string :examen_oncologic_san
      t.string :examen_oncologic_genital_feminin
      t.string :examen_oncologic_citologie_secretie
      t.string :examen_oncologic_prostata_rect
      t.string :examen_oncologic_alte
      t.timestamps
    end
  end
end
