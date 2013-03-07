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
  puts "Getting #{uri}"
  theuri = URI(uri)
  puts "Uri is #{theuri}"
    Net::HTTP.get(theuri)
  end
end
