class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :title
      t.text :description
      t.boolean :published
      t.belongs_to :city, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :tours, :published
  end
end
