require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is a valid user with all fields' do
      params = { first_name: 'daniel', last_name: 'tan', email: '123@example.com', password: '1234', password_confirmation: '1234'}
      expect(User.new(params)).to be_valid
    end

    it 'is invalid if passwords are not matching' do
      params = { first_name: 'daniel', last_name: 'tan', email: '123@example.com', password: '1234', password_confirmation: '12345'}
      expect(User.new(params)).to_not be_valid
    end

    it 'is invalid if email is not unique' do
      existing_params = { first_name: 'daniel', last_name: 'tan', email: '123@example.com', password: '1234', password_confirmation: '1234'}
      existing_user = User.create(existing_params)
      
      params = { first_name: 'daniel', last_name: 'tan', email: '123@EXAMPLE.com', password: '1234', password_confirmation: '1234'}
      expect(User.new(params)).to_not be_valid
    end

    it 'is invalid if password is not at least 3 characters' do
      params = { first_name: 'daniel', last_name: 'tan', email: '123@example.com', password: '12', password_confirmation: '12'}
      expect(User.new(params)).to_not be_valid
    end

    it 'is invalid if email has not been entered' do
      params = { first_name: 'daniel', last_name: 'tan', email: nil, password: '1234', password_confirmation: '1234'}
      expect(User.new(params)).to_not be_valid
    end

    it 'is invalid if first name has not been entered' do
      params = { first_name: nil, last_name: 'tan', email: '123@example.com', password: '1234', password_confirmation: '1234'}
      expect(User.new(params)).to_not be_valid
    end

    it 'is invalid if last name has not been entered' do
      params = { first_name: 'daniel', last_name: nil, email: '123@example.com', password: '1234', password_confirmation: '1234'}
      expect(User.new(params)).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    it 'is invalid if password is nil or incorrect' do
      @user = User.create(first_name: 'daniel', last_name: 'tan', email: '123@example.com', password: '1234', password_confirmation: '1234')
      expect(User.authenticate_with_credentials("123@example.com", 'tbd')).to be_nil
    end

    it 'should return the user if the email and password are correct' do
      @user = User.create(first_name: 'daniel', last_name: 'tan', email: '123@example.com', password: '1234', password_confirmation: '1234')
      expect(User.authenticate_with_credentials("123@example.com", '1234')).to eql(@user)
    end

    it 'should return the user if there are spaces before or after the email' do
      @user = User.create(first_name: 'daniel', last_name: 'tan', email: '123@example.com', password: '1234', password_confirmation: '1234')
      expect(User.authenticate_with_credentials(" 123@example.com ", '1234')).to eql(@user)
    end

    it 'should return the user regardless of the email case' do
      @user = User.create(first_name: 'daniel', last_name: 'tan', email: '123@example.com', password: '1234', password_confirmation: '1234')
      expect(User.authenticate_with_credentials("123@EXAMPLE.com", '1234')).to eql(@user)
    end

  end
end
