class Product

    attr_accessor :name, :price, :image
  
    def initialize(name, price, image)
      @name = name
      @price = price
      @image = image
    end
    
end