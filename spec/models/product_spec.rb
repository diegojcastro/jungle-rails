require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should not create a valid record until saved' do
      @product = Product.new
      expect(@product.id).to be_nil
    end

    it 'should create a valid category when provided a name' do
      @category = Category.new(name: 'New Category Name')
      @category.save
      expect(@category.id).to be_present
    end

    it 'should create a valid record when initialized properly' do
      @test_category = Category.new(name: "Test Category")
      @test_category.save
      @product = Product.new(name: "TestName",
        description: "Test Description Here",
        category: @test_category,
        quantity: 2,
        price: 7500
      )
      @product.save

      expect(@product.id).to be_present
      expect(@product.name).to eq("TestName")
      expect(@product.description).to eq("Test Description Here")
      expect(@product.quantity).to eq(2)
    end

    it 'should not create a product when provided no arguments' do
      @product = Product.new
      @product.save
      expect(@product.id).to be_nil
      expect(@product.errors.full_messages).to include(/can't be blank/)

    end

    it 'should not create a valid record when missing a name' do
      @test_category = Category.new(name: "Test Category")
      @test_category.save
      @product = Product.new(
        description: "Test Description Here",
        category: @test_category,
        quantity: 2,
        price: 7500
      )
      @product.save

      expect(@product.id).to be_nil
      expect(@product.errors.full_messages).to include(/can't be blank/)

    end

    it 'should create a valid record when missing a description' do
      @test_category = Category.new(name: "Test Category")
      @test_category.save
      @product = Product.new(
        name: "Test Name",
        category: @test_category,
        quantity: 2,
        price: 7500
      )
      @product.save

      expect(@product.id).to be_present
    end

    it 'should not create a valid record when missing a quantity' do
      @test_category = Category.new(name: "Test Category")
      @test_category.save
      @product = Product.new(
        name: "Test Name",
        description: "Some description",
        category: @test_category,
        price: 7500
      )
      @product.save

      expect(@product.id).to be_nil
      expect(@product.errors.full_messages).to include(/can't be blank/)

    end

    it 'should not create a valid record when missing a price' do
      @test_category = Category.new(name: "Test Category")
      @test_category.save
      @product = Product.new(
        name: "Test Name",
        description: "Some description",
        category: @test_category,
        quantity: 2
      )
      @product.save

      expect(@product.id).to be_nil
      expect(@product.errors.full_messages).to include(/can't be blank/)
    end

    it 'should not create a valid record when missing a category' do
      @product = Product.new(
        name: "Test Name",
        description: "Some description",
        quantity: 2,
        price: 7500
      )
      @product.save

      expect(@product.id).to be_nil
      expect(@product.errors.full_messages).to include(/can't be blank/)

    end

  end
end