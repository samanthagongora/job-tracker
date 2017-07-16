class CategoriesController < ApplicationController

  CATEGORIES = Category.all.pluck(:title)

  def index
    @categories = Category.all
  end
end
