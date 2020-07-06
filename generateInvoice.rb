require_relative 'SaleTax'

puts "Gerenating first invoice"
SaleTax.new.input_one
puts "First invoice generated at ./input_one.csv"

puts "Gerenating second invoice"
SaleTax.new.input_two
puts "First invoice generated at root ./input_two.csv"

puts "Gerenating third invoice"
SaleTax.new.input_three
puts "First invoice generated at root ./input_three.csv"