class CreateAlims < ActiveRecord::Migration[5.1]
  def change
    create_table :alims do |t|

      t.integer :miktar, null: false
      t.datetime :tarih
      t.boolean :gonderildi
      t.boolean :teslim_alindi

      t.timestamps
      t.references :teklif
      t.references :eczane
    end
  end
end
