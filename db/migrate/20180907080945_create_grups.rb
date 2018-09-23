class CreateGrups < ActiveRecord::Migration[5.1]
  def change
    create_table :grups do |t|
      t.string :ad
      t.timestamps
    end
  end
end
