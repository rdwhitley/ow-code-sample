require 'rails_helper'
require "json-schema"
require "json"
RSpec.describe DataTransformService do

  let!(:csv_path) { 'spec/csv/sample-part-data.csv'}
  let!(:service) { DataTransformService.new}
  let!(:schema) { schema = {
    "type" => "object",
    "required" => ["sku","display_pn", "be_product_cat_name", "short_description", "lead_time", "meta_description", "meta_title", "part_status", "images", "attributes"],
    "properties" => {
      "sku" => {"type" => "string"},
      "display_pn" => {"type" => "string"},
      "be_product_cat_name" => {"type" => "string"},
      "short_description" => {"type" => "string"},
      "lead_time" => {"type" => "string"},
      "meta_description" => {"type" => "string"},
      "meta_title" => {"type" => "string"},
      "part_status" => {"type" => "string"},
      "images" => {"type" => "array"},
      "attributes" => {"type" => "array"}
       }
      }
    }
  describe '#transform' do

    it 'should transform rows in the passed file from csv to JSON docs' do
      result = service.transform(csv_path)
      expect(result).to eql(25)

    end

  end
  
  describe '#formatHash' do

    it 'should format a given row to the expected hash format' do
      row = service.getFirstRow(csv_path)
      File.write("schema.json", JSON.dump(schema))
      expect(JSON::Validator.validate("schema.json", service.formatHash(row))).to eql(true)
    end

  end

end