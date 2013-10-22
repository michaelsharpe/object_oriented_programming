class Item
  attr_accessor :type, :price, :imported

  def initialize(type, price, imported)
    @type = type
    @price = price
    @imported = imported
    @tax = 0.1 
  end

  def tax_percent
    case @type
    when :book, :food, :medical 
      if @imported == true 
        @tax = 0.5
      else
        @tax = 0
      end
    else
      if @imported == true
        @tax = 0.15
      end
    end
    @tax
  end

  def tax_total
    self.tax_percent
    tax = @tax * @price / 100

    #round tax to nearest 0.05
    if tax % 0.05 != 0
      tax +=  0.05 - (tax % 0.05)
    end

    return tax
  end

  def total_price
    self.tax_total + @price
  end

end

book = Item.new(:book, 12.49, false)
puts book.total_price
puts book.tax_percent
puts book.tax_total
chocolates = Item.new(:food, 10.00, true)
puts chocolates.price
puts chocolates.type
puts chocolates.imported
puts chocolates.total_price
puts chocolates.tax_percent
puts chocolates.tax_total
