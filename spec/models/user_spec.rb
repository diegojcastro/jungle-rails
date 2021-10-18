require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should not create a valid record until saved' do
      @user = User.new
      expect(@user.id).to be_nil
    end

    

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
