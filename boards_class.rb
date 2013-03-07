require './modules'
require './threads_class'

class Boards
  def initialize(board)
    @board = board
    puts "Trying to parse api.4chan.org/#{board}/catalog.json"
    @json = JsonParser::get("api.4chan.org/#{board}/catalog.json")
  end
  
  def search_for(terms)
    @arraythread = Array.new
      each_thread do |t|
        unless t["com"].nil?
          if t["com"].downcase.include? terms
          @arraythread << t["no"]
          end
        end
      end
    return @arraythread
  end
  
  def archive_board(directory)
	  each_thread do |thread|
		Threads.new(thread["no"], @board).download_thread(directory)
	  end
  end

def each_thread(&block)

    @json.each do |page|

      page['threads'].each do |thread|

        yield(thread)
      end

    end
  end
end  
