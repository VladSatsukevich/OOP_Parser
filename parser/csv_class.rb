require 'csv'

class CSV_class

  attr_accessor :file_name, :name, :price, :image
  
    def initialize (file_name, name, price, image)
      @file_name = file_name
      @name = name
      @price = price
      @image = image
    end
   
    def self.csv_create (file_name)
      CSV.open(file_name + ".csv", 'w') do |csv|
      csv << ["Name", "Price", "Image"]
      puts "File #{file_name} was created!"
      end
    end

    def self.csv_add (file_name, name, price, image)
      CSV.open(file_name + ".csv", 'a') do |csv|
      csv << [name, price, image]
      end
    end

end

