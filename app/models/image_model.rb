# frozen_string_literal: true

class Image < ActiveRecord::Base
  self.table_name = 'images' # Specifies the table name as 'images'

  # Define the attributes corresponding to the database fields
  attr_accessor :title, :url, :description

  # Add validations for the attributes
  validates_presence_of :title, :url, :description
end
