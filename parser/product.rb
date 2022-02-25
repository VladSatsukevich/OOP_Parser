class Product

  attr_accessor :name, :price, :image
  
  def initialize (name, price, image)
    @name = name
    @price = price
    @image = image
  end

  private
  def self.save (file_name, name, price, image)
    CSV.open(file_name + ".csv", 'a') do |csv| csv << [name, price, image] end
  end
end

