require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
   # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can add an item to an empty cart" do
    # ACT
    visit root_path 
    save_screenshot 'my_cart_0.png'
    
    expect(page).to have_content 'My Cart (0)'
    
    click_button('Add', match: :first)
    
    expect(page).to have_content 'My Cart (1)'

    save_screenshot 'my_cart_1.png'
  end
end
