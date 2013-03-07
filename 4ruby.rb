require 'rubygems'
require 'json'
require 'net/http'
require 'open-uri'
require './fc_class'

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
	if argument.downcase.include? "mirror"
		puts "Command is ab"
		$command = "ab"
		$directory = ARGV.to_a[i+1]
		end
end
fc = FourChan.new($board)



unless $command.nil?

if $command.include? "ab"
  fc.archboard($directory)
  end
  


if $command.include? "search"
  fc.search_for $term
end
unless $option.nil?
if $option.include? "list"
puts "including a list"
  fc.list
end
if $option.include? "archive"
  fc.archive_threads($directory)
end
end
end
end
