# frozen_string_literal: true

require 'csv'

class User < ApplicationRecord
  include CsvExportable
end
