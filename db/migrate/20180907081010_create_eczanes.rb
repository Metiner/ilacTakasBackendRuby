class CreateEczanes < ActiveRecord::Migration[5.1]
  def change
    create_table :eczanes do |t|

      t.string :ad, null: false
      t.string :gln_no, null: false
      t.decimal :bakiye, default: 0
      t.integer :actigi_teklif_sayisi, default: 0
      t.timestamps

      t.references :grup
      t.references :user

    end
  end
end
