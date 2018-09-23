class CreateTeklifs < ActiveRecord::Migration[5.1]
  def change
    create_table :teklifs do |t|

      t.string :barcode, null: false
      t.integer :alim_miktari, null: false
      t.integer :mal_fazlasi, null: false
      t.integer :min_alim, null: false
      t.integer :max_alim, null: false
      t.integer :hedeflenen_alim, null: false
      t.datetime :baslangic_tarihi, null: false
      t.datetime :bitis_tarihi, null: false
      t.datetime :son_kul_tarihi, null: false
      t.decimal :etiket_fiyati, null: false
      t.decimal :depo_fiyati, null: false
      t.decimal :net_fiyat, null: false
      t.boolean :hedeflenen_alim_gecilsin, default: false
      t.boolean :eczaneye_ozel, default: false
      t.string :ozel_eczane_id
      t.integer :alinmis_miktar, default: 0
      t.string :yemek_ceki_elden_nakit
      t.string :ekstra_urun

      t.timestamps
      t.references :eczane
    end
  end
end
