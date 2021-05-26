class Admin::CategoriesController < Admin::BaseAdminController
  def index
    @categories = Category.order(:name).all
  end

  def new
    @category = Category.new
  end

  def create
  end
end
