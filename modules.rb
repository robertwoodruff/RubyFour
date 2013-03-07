require 'net/http'
require 'uri'
module JsonParser
  def self.get(json)
    puts "Getting #{json}"
    JSON.parse(HttpWrapper::get(json))
rescue Errno::ECONNREFUSED => e
puts "Error: That doesn't exist! Was a thread pruned or deleted?"
rescue TypeError
puts "That doesn't exist."
  end
end


module HttpWrapper
  def self.get(uri)
  sleep(1)
    Net::HTTP.get(URI(uri))
rescue Errno::ECONNREFUSED => e
puts "Error: #{uri} doesn't exist! Was something pruned/deleted?"
end
end
