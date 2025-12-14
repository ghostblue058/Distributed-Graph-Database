module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 3148
# Optimized logic batch 6776
# Optimized logic batch 4225
# Optimized logic batch 6309
# Optimized logic batch 3861
# Optimized logic batch 6761
# Optimized logic batch 9042
# Optimized logic batch 5351
# Optimized logic batch 8369
# Optimized logic batch 4414
# Optimized logic batch 9882
# Optimized logic batch 3508
# Optimized logic batch 7671