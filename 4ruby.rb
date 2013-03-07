require 'rubygems'
require 'json'
require 'net/http'
require 'open-uri'
require 'optparse'
require './fc_class'

options = OptionParser.new do |opt|
  opt.on '-b', '--board BOARD', 'The 4chan board to work on.' do |o|
    $board = o
  end
  opt.on '-s', '--search TEXT', 'Filters the search by text' do |o|
    $command = :search
    $term = o
  end
  opt.on '-a', '--archive DIR', 'Directory to archive to' do |o|
    $option = :archive
    $directory = o
  end
  opt.on '-m', '--mirror DIR', 'Create a mirror' do |o|
    $option = :ab # TODO - Rename?
    $directory = o
  end
  opt.on '-l', '--list', 'List the results' do |o|
    $option = :list
  end

end.tap {|o| o.parse!} # Destructively edit ARGV removing anything that matched.

fc = FourChan.new($board)

abort 'Please enter a command' if $command.nil?

if $command == :ab
  fc.archive_board($directory)
end
if $command == :search
  fc.search_for $term
end
unless $option.nil?
  if $option == :list
    fc.list
  end
  if $option == :archive
    fc.archive_threads $directory
  end
end

