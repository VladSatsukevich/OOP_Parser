require 'yaml'

require_relative 'product'
require_relative 'parsing'

parameters = YAML.load_file('parameters.yaml')
Product.csv_create(parameters['file'])
Parsing.parse_category(parameters['file'], parameters['link'])
