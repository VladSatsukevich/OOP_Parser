require 'yaml'

require_relative 'csv_class'
require_relative 'parsing'

parameters = YAML.load_file('parameters.yaml')
CSV_class.csv_create(parameters['file'])
Parsing.parse_category(parameters['file'], parameters['link'])
