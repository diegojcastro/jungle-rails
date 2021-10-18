require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should not create a valid record until saved' do
      @user = User.new
      expect(@user.id).to be_nil
    end
    
    it 'should not create a valid record without a password' do
      @user = User.new(
        name: 'Diego',
        email: 'diego@diego.com'
      )
      @user.save
      expect(@user.id).to be_nil
    end

    it 'should create a valid user after saving given a password digest' do
      @user = User.new(
        name: 'Diego',
        email: 'diego@diego.com',
        password_digest: 'abcdefghijklmnop'
      )
      @user.save
      expect(@user.id).to be_present
      expect(@user.name).to eq('Diego')
      expect(@user.email).to eq('diego@diego.com')
    end

    it 'should create a valid user after saving given a password and password confirmation that match' do
      @user = User.new(
        name: 'Diego',
        email: 'diego@diego.com',
        password: 'hello12345goodbye',
        password_confirmation: 'hello12345goodbye'
      )
      @user.save
      expect(@user.id).to be_present
      expect(@user.name).to eq('Diego')
      expect(@user.email).to eq('diego@diego.com')
    end

    it 'should not create a user after saving given a password and password confirmation that do not match' do
      @user = User.new(
        name: 'Diego',
        email: 'diego@diego.com',
        password: 'hello12345goodbye',
        password_confirmation: 'goodbye12345hello'
      )
      @user.save
      expect(@user.id).to be_nil
    end

    it 'should not create a user if the email is already taken' do
      @user = User.new(
        name: 'Diego',
        email: 'diego@diego.com',
        password: 'hello12345goodbye',
        password_confirmation: 'hello12345goodbye'
      )
      @user.save
      expect(@user.id).to be_present
      expect(@user.name).to eq('Diego')
      expect(@user.email).to eq('diego@diego.com')

      @user2 = User.new(
        name: 'Billybob',
        email: 'diego@diego.com',
        password: 'another123password',
        password_confirmation: 'another123password'
      )
      @user2.save
      expect(@user.id).to be_nil

    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
