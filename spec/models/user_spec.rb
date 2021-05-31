require 'rails_helper'

RSpec.describe User, type: :model do
  before (:each) do
    @user = User.create first_name: 'Clark', last_name: 'Kent', email: 'im@superhero.com', password: 'superman', password_confirmation: 'superman'
    @user2 = User.create first_name: 'Bruce', last_name: 'Wayne', email: 'im@superhero.com', password: 'mypassword', password_confirmation: 'mypassword'
  end

  describe 'Validations' do

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
    it 'is not valid if first_name field is empty' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid if last_name field is empty' do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    
    it 'should return the user if email and password are valid' do
      valid_user = User.authenticate_with_credentials('im@superhero.com', 'superman')
      expect(valid_user).to eq(@user)
    end

    it 'should return nil if email and password are not valid' do
      invalid_user = User.authenticate_with_credentials('im@superhero.com', 'mypassword')
      expect(invalid_user).to be_nil
    end

    it 'should successfully authenticate even if there are spaces before/after email address' do
      valid_user = User.authenticate_with_credentials(' im@superhero.com ', 'superman')
      expect(valid_user).to eq(@user)
    end

    it 'should successfully authenticate regardless of case in email address' do
      valid_user = User.authenticate_with_credentials('IM@superhero.COM', 'superman')
      expect(valid_user).to eq(@user)
    end

  end
end
