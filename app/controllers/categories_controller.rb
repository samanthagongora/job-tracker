class CategoriesController < ApplicationController

  CATEGORIES = Category.all.pluck(:title)

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} added!"
      redirect_to category_path(@category)
    else
      flash[:notice] = "That category already exists"
      redirect_to new_category_path
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    flash[:success] = "#{category.title} was successfully deleted!"
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
