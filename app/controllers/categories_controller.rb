class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @tours = @category.tours.published
  end
end
