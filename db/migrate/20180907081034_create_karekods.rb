class CreateKarekods < ActiveRecord::Migration[5.1]
  def change
    create_table :karekods do |t|

      t.string :karekod
      t.timestamps

      t.references :alim
    end
  end
end
