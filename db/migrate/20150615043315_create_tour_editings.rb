class CreateTourEditings < ActiveRecord::Migration
  def change
    create_table :tour_editings do |t|
      t.belongs_to :tour, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
