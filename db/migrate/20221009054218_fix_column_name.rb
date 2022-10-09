class FixColumnName < ActiveRecord::Migration[6.1]
  def change
  end

  def self.up
    rename_column :parts, :attributes, :part_attributes
  end
end
