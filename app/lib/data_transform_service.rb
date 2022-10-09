require 'csv'
require "json"
class DataTransformService

  # ==== This method does:
  #
  #  Iterates over the csv and transforms it into JSON documents
  #
  # ==== With params:
  #
  # @param file_path <String> - Path to the csv file to process
  #
  # ==== And returns:
  #
  # @return total_records_processed
  #
  # ==== And is used like:
  #
  # service.transform(csv_path)
  #
  def transform(file_path)
    Rails.logger.info("Processing file from location: [#{file_path}]")
    row_counter = 0

    CSV.open(file_path, 'r:UTF-8', headers: true) do |csv|
      csv.each do |csv_row|
        Rails.logger.debug("Processing row: #{csv_row}")
        formatted_row = formatHash(csv_row)
        if JSON::Validator.validate("schema.json", formatted_row)
          File.write("storage/row-#{row_counter}.json", JSON.dump(formatted_row))
        end
        row_counter += 1
      end
    end
    row_counter
  end
  
   # ==== This method does:
  #
  #  formats a csv row into the expected schema
  #
  # ==== With params:
  #
  # @param row <Hash> - Row read from a csv in the form of a hash 
  #
  # ==== And returns:
  #
  # @return formatted_hash
  #
  # ==== And is used like:
  #
  # service.formatHash(row)
  #
  def formatHash(row)
    formatted_hash = {
      "sku" => row["sku"], 
      "display_pn" => row["display_pn" ], 
      "be_product_cat_name" => row["be_product_cat_name"],
      "short_description" => row["short_description"],
      "lead_time" => row["lead_time"],
      "meta_description" => row["meta_description"],
      "meta_title" => row["meta_title"],
      "part_status" => row["part_status"],
      "images" => [row["image"], row["prod_drawing"], row["datasheet"], row["3d_model_iges"]],
      "attributes" => [row["eu_rohs_y"], row["china_rohs"], row["reach"], 
      row["halogen_free"], row["country_of_manufacture"], row["package_qty"], row["primary_pack_type"], 
      row["primary_pack_qty"], row["contact_location_filter"], row["current_rating"], row["dielectric_withstanding_volt"],
      row["material_insulator"], row["material_shield"], row["material_slider"], row["number_of_contacts_filter"], row["operating_temperature_range"],
      row["orientation_filter"], row["packaging"], row["termination_style_filter"], row["voltage_rating"]]
    }
    return formatted_hash
  end
  
  
  # ==== This method does:
  #
  #  Returns the first row of a csv that has been read
  #
  # ==== With params:
  #
  # @param file_path <String> - Path to the csv file to process
  #
  # ==== And returns:
  #
  # @return first_row
  #
  # ==== And is used like:
  #
  # service.getFirstRow(csv_path)
  #
  def getFirstRow(file_path)
    csv_row = nil
    CSV.open(file_path, 'r:UTF-8', headers: true) do |csv|
    csv_row = csv.first
    end
    return csv_row
  end

end