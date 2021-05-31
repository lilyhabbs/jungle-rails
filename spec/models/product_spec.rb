require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before (:all) do
      @category = Category.new name: 'Apparel'
      @product = Product.new name: 'A non-graphic graphic tee', price: 1120, quantity: 42, category: @category
    end

    it 'is valid if all fields validated' do
      expect(@product).to be_valid
    end

    # validates :name
    it 'is not valid if name field is empty' do
      @product.name = nil
      expect(@product).to_not be_valid
    end

    # validates :price
    it 'is not valid if price field is empty' do
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end

    # validates :quantity
    it 'is not valid if quantity field is empty' do
      @product.quantity = nil
      expect(subject).to_not be_valid
    end

    # validates :category
    it 'is not valid if category field is empty' do
      @product.category = nil
      expect(@product).to_not be_valid
    end

  end
end
