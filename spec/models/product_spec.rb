require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it "is a valid product with all values filled" do
      @category = Category.new
      params = { name: 'Mikey', description: 'Big plant', quantity: 20, category: @category, price: 9000 }
      expect(Product.new(params)).to be_valid
    end

    it "is not a valid product with no name" do
      @category = Category.new
      params = { name: nil, description: 'Big plant', quantity: 20, category: @category, price: 9000 }
      expect(Product.new(params)).to_not be_valid
    end

    it "is not a valid product with no price" do
      @category = Category.new
      params = { name: 'Mikey', description: 'Big plant', quantity: 20, category: @category }
      expect(Product.new(params)).to_not be_valid
    end

    it "is not a valid product with no quantity" do
      @category = Category.new
      params = { name: 'Mikey', description: 'Big plant', quantity: nil, category: @category, price: 9000}
      expect(Product.new(params)).to_not be_valid
    end

    it "is not a valid product with no category" do
      @category = Category.new
      params = { name: 'Mikey', description: 'Big plant', quantity: 20, category: nil, price: 9000 }
      expect(Product.new(params)).to_not be_valid
    end
    
  end

end
