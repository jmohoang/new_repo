# frozen_string_literal: true

class RedisService
  class << self
    # Set a key-value pair in Redis
    def set(key, value)
      with_connection { |conn| conn.set(key, value) }
    end

    # Retrieve the value of a key from Redis
    def get(key)
      with_connection { |conn| conn.get(key) }
    end

    # Delete a key and its associated value from Redis
    def delete(key)
      with_connection { |conn| conn.del(key) }
    end

    private

    # Execute a block of Redis operations within a connection
    def with_connection(&block)
      connection.with(&block)
    end

    # Establish a Redis connection using a connection pool
    def connection
      # Use ENV.fetch to provide default values for REDIS_CONNECTION_POOL_SIZE and REDIS_CONNECTION_POOL_TIMEOUT
      @connection ||= ConnectionPool.new(size: ENV.fetch('REDIS_CONNECTION_POOL_SIZE', 5).to_i,
                                         timeout: ENV.fetch(
                                           'REDIS_CONNECTION_POOL_TIMEOUT', 5
                                         ).to_i) do
        Redis.new(url: ENV['REDIS_URL'])
      end
    end
  end
end
