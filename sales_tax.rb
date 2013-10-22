class Item
  attr_accessor :type, :price, :imported

  def initialize(type, price, imported)
    @type = type
    @price = price.to_i
    @imported = imported ||= false
  end

  def tax
    case @type
    when :book, :food, :medical 
      if @imported == true 
        @price * 0.15
      else
        @price * 0.1
      end
    else
      if @imported == true
        @price * 0.5
      end
    end
  end

end

