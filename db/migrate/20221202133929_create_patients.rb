class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :lastname
      t.string :firstname
      t.datetime :data_nasterii
      t.integer :varsta
      t.string :sex
      t.string :cnp, unique: true
      t.string :serie_nr_buletin
      t.string :localitate
      t.string :judet
      t.string :adresa
      t.string :email
      t.string :grup_sangvin
      t.float :greutate
      t.float :inaltime
      t.boolean :rh
      t.string :alergii
      t.string :ocupatie
      t.timestamps
    end
  end
end
