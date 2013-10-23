class Product
  attr_accessor :name, :quantity, :type, :price, :imported

  def initialize(name, quantity, type, price, imported=false)
    @name = name
    @quantity = quantity
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
    @item_list = []
    @tax_total = 0
    @total = 0
  end

  def scan(*items)
    items.each do |item| 
      @item_list << item
      @tax_total += calc_tax(item)
      @total += calc_total(item)
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
    tax_total.round(2)
  end

  def calc_total(item)
    item.price + calc_tax(item)
  end

  def receipt
    printout = String.new
    @item_list.each do |item|
      printout << "#{item.quantity} #{item.name}: #{calc_total(item)} \n"
    end
    printout << "Sales Taxes: #{@tax_total} Total: #{@total}"
    #reset instance variables for next scan
    @item_list = []
    @tax_total = 0
    @total = 0

    p printout
  end

end

book = Product.new("book", 1, "book", 12.49)
cd = Product.new("music CD", 1, "cd", 14.99)
bar = Product.new("chocolate bar", 1, "food", 0.85)



register= CashRegister.new