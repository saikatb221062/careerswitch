$redis = Redis.new(url: ENV["REDIS_URL"], ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE })
Redis.current = Redis.new(:host => '127.0.0.1', :port => 6379)
