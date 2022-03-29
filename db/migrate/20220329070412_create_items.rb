class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :price
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
