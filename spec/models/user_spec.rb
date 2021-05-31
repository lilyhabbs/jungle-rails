require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before (:each) do
      @user = User.create name: 'Clark Kent', email: 'im@superhero.com', password: 'mypassword', password_confirmation: 'mypassword'
      @user2 = User.create name: 'Bruce Wayne', email: 'im@superhero.com', password: 'mypassword', password_confirmation: 'mypassword'
    end

    it 'is valid if all fields validated' do
      expect(@user).to be_valid
    end

    # validates :password
    it 'is not valid if password field is empty' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid if password and password_confirmation do not match' do
      @user.password_confirmation = 'notmypassword'
      expect(@user).to_not be_valid
    end

    it 'is not valid if password is less than 8 characters' do
      @user.password = 'mypass'
      @user.password_confirmation = 'mypass'
      expect(@user).to_not be_valid
    end

    # validates :email
    it 'is not valid if email field is empty' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid if email is not unique' do
      expect(@user2).to_not be_valid
    end

    it 'is not valid if email is not unique regardless of case' do
      @user2.email = 'IM@SUPERHERO.COM'
      expect(@user2).to_not be_valid
    end

    # validates :name
    it 'is not valid if name field is empty' do
      @user.name = nil
      expect(@user).to_not be_valid
    end
  end
end
