# frozen_string_literal: true

module CsvExportable
  extend ActiveSupport::Concern

  # This module provides the functionality to export ActiveRecord models to CSV format.

  class_methods do
    # Converts the ActiveRecord model records to a CSV string.
    #
    # Example usage:
    #   csv_data = User.to_csv
    #
    # Returns:
    #   A CSV string representation of the model records.
    #
    # CSV format:
    #   The CSV header row contains the names of the columns, based on the model's column names.
    #   Each subsequent row represents a record, with attribute values in the respective columns.
    #
    # Note: The model class using this module must have the 'column_names' method available.
    #
    def to_csv
      CSV.generate(headers: true) do |csv|
        csv << column_names

        all.each do |record|
          csv << record.attributes.values
        end
      end
    end
  end
end
