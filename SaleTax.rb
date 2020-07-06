require_relative 'product.rb'
require 'csv'

class SaleTax

  def input_one
   p1 = Product.new('books', 1, 12.49, false, 'books')
   p2 = Product.new('music', 1, 14.99, false, 'cd')
   p3 = Product.new('food', 1, 0.85, false, 'chocolate bar')
   products = [p1,p2,p3]
   create_csv('input_one', products)
  end

  def input_two
    p1 = Product.new('food', 1, 10.00, true, 'chocolate')
    p2 = Product.new('perfume', 1, 47.50, true, 'perfume')
    products = [p1,p2]
    create_csv('input_two', products)
  end

  def input_three
   p1 = Product.new('perfume', 1, 27.99, true, 'perfume')
   p2 = Product.new('perfume', 1, 18.99, false, 'perfume')
   p3 = Product.new('medical', 1, 9.75, false, 'headache pills')
   p4 = Product.new('food', 1, 11.25, true, 'chocolate')
   products = [p1,p2,p3,p4]
   create_csv('input_three', products)
  end

  private

  def accumulate_sale_tax products
    total_sale_tax = products.inject(0){|sum,product| sum + calculate_sale_tax(product).round(2) }
    total_sale_tax.round(2)
  end

  def calculate_sale_tax product
    product.calculate_price - product.price
  end

  def amount products
    sum = products.inject(0){|sum,obj| sum + obj.price }
    sum.round(2)
  end

  def create_csv name, products
    sale_tax = accumulate_sale_tax(products)
    amount = amount(products)
    total_amount = sale_tax + amount
    CSV.open("#{name}.csv", "w") do |csv|
      csv << ['Quantity', 'Category', 'Name', 'Price']
      products.each do |product|
        csv << [product.quantity, "#{product.category} #{product.name}", product.calculate_price.round(2)]
      end
      csv << ['Sale tax']
      csv << [sale_tax]
      csv << ['total amount']
      csv << [total_amount]
    end
  end
end