require 'csv'

module CSV_modules
    def csv_add (file_name, name, price, image)
        CSV.open(file_name + ".csv", 'a') do |csv|
        csv << [name, price, image]
        end
    end
        
    def csv_create (file_name)
        CSV.open(file_name + ".csv", 'w') do |csv|
        csv << ["Name", "Price", "Image"]
        puts "File #{file_name} was created!"
        end
    end
end