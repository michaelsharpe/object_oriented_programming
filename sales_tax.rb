class Product
  attr_accessor :name, :type, :price, :imported

  def initialize(name, type, price, imported)
    @name = name
    @type = type
    @price = price
    @imported = imported
  end
end

class CashRegister
  attr_reader :item_list, :tax_list

  @@sales_tax = 0.1
  @@import = 0.05

  def initialize
    @item_list=[]
    @tax_list = []
  end

  def scan(*items)
    items.each do |x| 
      @item_list << x
      @tax_list << calc_tax(x)
    end
  end

  def tax_rate(item)
    @tax_rate = 0.0
    @tax_rate += @@import if item.imported == true
    @tax_rate += @@sales_tax unless item.type == "book" || item.type == "food" || item.type == "medicine"
    @tax_rate
  end


  def calc_tax(item)
    tax_total = item.price * tax_rate(item)
    tax_total +=  0.05 - (tax_total % 0.05) if  tax_total % 0.05 != 0
    tax_total
  end

  def receipt


  end

end

book=Product.new("book", "book", 12.49, false)
wine=Product.new("wine", "alchohol", 15.00, true)

register= CashRegister.new

puts book.type
puts book.price
puts register.tax_rate(book)
puts register.tax_rate(wine)

register.scan(book, wine)
puts register.item_list
puts register.tax_list
