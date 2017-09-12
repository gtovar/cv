require 'redis'
begin
    $redis = Redis.new(url: ENV['REDISCLOUD_URL'])
rescue Exception => e
    puts e
end
