class Product
  attr_accessor :name, :price, :imported, :quantity

  def initialize(name, price, imported=false, quantity=1)
    @name = name
    @price = price
    @quantity = quantity
    @imported = imported
  end

end

class Exempt < Product
  def tax_rate
    @tax_rate = 0
    @tax_rate += 0.05 if item.imported == true
  end
end

class CashRegister
  attr_reader :item_list, :tax_list


  def initialize
    item_list= []
    tax_total= 0.0
    @total= 0.0
    @tax_rate
  end

  def scan(*items)
    items.each do |item| 
      @item_list << item
      @tax_total += calc_tax(item)
      @total += calc_total(item)
    end
  end

  def tax_rate
    @tax_rate = 0.1
    @tax_rate
  end

  def calc_tax(item)
    total = item.price * tax_rate
    total +=  0.05 - (total % 0.05) if  total % 0.05 != 0.0
    return total
  end

  def calc_total(item)
    total = item.price + calc_tax(item)
  end

  def print(price)
    sprintf("%.2f", price)
  end

  def receipt
    printout = "\n"

    @item_list.each do |item|
      printout << "#{item.quantity} #{item.name}: #{print(calc_total(item))}" + "\n"
    end
    printout << "Sales Taxes: #{print(@tax_total)} \nTotal: #{print(@total)}"
    #reset instance variables for next scan
    @item_list = []
    @tax_total = 0.0
    @total = 0.0

    puts printout
  end

end

book = Book.new("book", 12.49)
cd = Product.new("music CD", 14.99)
bar = Food.new("chocolate bar", 0.85)

chocolates = Food.new("imported box of chocolates", 10.00, true)
perfume = Product.new("imported bottle of perfume", 47.50, true)

perfume2 = Product.new("imported bottle of perfume", 27.99, true)
perfume3 = Product.new("bottle of perfume", 18.99)
pills = Medicine.new("packet of headache pills", 9.75)
chocolates2 = Food.new("imported box of chocolates", 11.25, true)

register= CashRegister.new

register.scan(book, cd, bar)
register.receipt
register.scan(chocolates, perfume)
register.receipt
register.scan(perfume2, perfume3, pills, chocolates2)
register.receipt

