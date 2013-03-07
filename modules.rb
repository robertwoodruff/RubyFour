require 'net/http'
require 'uri'
module JsonParser
  def self.get(json)
    puts "Getting #{json}"
    JSON.parse(HttpWrapper::get(json))
  end
end


module HttpWrapper
  def self.get(uri)
  sleep(1)
    Net::HTTP.get(URI(uri))
  end
end
