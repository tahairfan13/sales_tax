require_relative '../product'

describe Product do

  before :each do
    @product = Product.new('books', 1, 12.49, false)
    @product2 = Product.new('electronics', 2, 1000, false, 'uushah')
  end

  describe "#quantity" do
    it "returns the correct quantity" do
      @product.quantity.should eql 1
    end
  end

  describe "#price" do
    it "returns the price" do
      @product.price.should eql 12.49
    end
  end

  describe "#calculate_price_no_tax" do
    it "returns the correct price" do
      @product.calculate_price.should eql 12.49
    end
  end

  describe "#check_if_name_is_nil" do
    it "returns name as nil" do
      @product.name.should eql nil
    end
  end

  describe "#check_if_name_exist" do
    it "returns name" do
      @product2.name.should eql 'uushah'
    end
  end

  describe "#calculate_price_10$_rax" do
    it "returns the correct price related to 10 %" do
      @product2.calculate_price.should eql 2200.0
    end
  end


end