class Product
  CATEGORIES = ['books', 'food', 'medical']
  attr_accessor :quantity, :name, :price, :tax_percentage, :category

  def initialize (category, quantity, price, imported, name=nil)
    @category = category
    @quantity = quantity
    @price = price
    @name = name
    @imported = imported
    @tax_percentage = 0
    set_tax_amount
  end

  def set_category (category)
    @category = category
    set_tax_amount
  end

  def set_imported(imported)
    @imported = imported
    set_tax_amount
  end

  def imported
    @imported
  end


  def set_tax_amount
    @tax_percentage += 5 if @imported
    @tax_percentage += CATEGORIES.include?(@category) ? 0 : 10
  end


  def calculate_price
    increased_price = @tax_percentage/100.to_f
    increased_price *= @price
    total_price = @price + increased_price
    total_price * @quantity
  end

end