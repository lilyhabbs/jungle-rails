class Admin::DashboardController < Admin::BaseAdminController
  def show
    @total_products = Product.count
    @total_categories = Category.count
  end
end
