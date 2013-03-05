require 'rubygems'
require 'json'
require 'net/http'
require 'open-uri'
require 'fc_class'

def each_post(&block)
	@pages.each do |thread|
	thread.each do |threadt|
		threadt.each do |post|
		yield(post)
		end
		end
	end
end

  def each_thread(&block)
    
    @pages.each do |page|
    
      page['threads'].each do |thread|
        
        yield(thread)
      end
 
    end
  end


module JsonParser
  def self.get(json)
    
    JSON.parse(HttpWrapper::get(json))
  end
end


module HttpWrapper
  def self.get(uri)
  sleep(1)
    Net::HTTP.get(URI(uri))
  end
end

unless ARGV[1].nil?

ARGV.each_with_index do |argument, i|
	if argument.downcase.include? "board"
		$board = ARGV.to_a[i+1] 
		end
	if argument.downcase.include? "search"
		$command = "search"
		$term = ARGV.to_a[i+1] 
		end
	if argument.downcase.include? "archive"
		$option = "archive"
		$directory = ARGV.to_a[i+1]
		end
	if argument.downcase.include? "list"
		$option = "list"
		end	
end
fc = FourChan.new($board)

if $command.include? "search"
  fc.search_for $term
end

if $option.include? "archive"
  fc.archive_threads($directory)
end

if $option.include? "list"
  fc.list
end

end

