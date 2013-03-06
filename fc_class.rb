require './threads_class'
class FourChan

  def initialize(board)
    @board = board
    @api_url = "http://api.4chan.org/#{@board}/catalog.json"
  end

  def catalog
    JsonParser::get(@api_url)
  end

  def search_for(terms)
    @threadlist = []
    puts "Terms are #{terms}"
    @threadlist = Threads.new(catalog).search_for(terms)
  end
  
  def archive_threads(directory) #Saves the threads you've found to a directory
    @threadlist.each do |thread|
	Threads.new(@api_url).download_thread(@board, onethread(thread), directory)
    end
  end
  def onethread(num)
    JsonParser::get("http://api.4chan.org/#{@board}/res/#{num}.json")
  end
  def list
	
    if @threadlist.is_a? Array
    @threadlist.each do |t|
    puts t
    end
    end
    
  end

def archboard(directory)
  Threads.new(catalog).archive_board(@board, directory)
  end
end
