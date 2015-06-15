class CreateTourCategories < ActiveRecord::Migration
  def change
    create_table :tour_categories do |t|
      t.belongs_to :tour, index: true, foreign_key: true
      t.belongs_to :category, index: true, foreign_key: true
    end
    add_index :tour_categories, [:tour_id, :category_id], unique: true
  end
end
