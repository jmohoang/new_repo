# frozen_string_literal: true

class CacheController < ApplicationController
  def index
    @cached_time = Rails.cache.fetch('cached_time', expires_in: 1.minute) do
      Time.now
    end
  end
end
