class Threads
  def initialize(catalog)
    @pages = catalog
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
	

def download_thread(board, threadjson, directory)
  puts "Got #{threadjson} as the JSON"
  @athread = threadjson
  @board = board
  @directory = directory
  self.download_index
  each_post do |p|
  unless p["ext"].nil?
  download_image(p["tim"], p["ext"])
  end
end
end

def archive_board(board, directory)
  puts "Archive board"
  @board = board
  @directory = directory

  each_thread do |thread|
  @thread = thread["no"]
  @athread = singlethread(thread["no"])
  download_thread(@board, @athread, @directory)
  
	end
end

def download_image(time, extension)
    open("#{@directory}/#{time}#{extension}", "w") do |file|
    puts "Getting http://images.4chan.org/#{@board}/src/#{time}#{extension}"
    file << open("http://images.4chan.org/#{@board}/src/#{time}#{extension}").read
  end
end

def download_index
	
  index = HttpWrapper::get("http://boards.4chan.org/#{@board}/res/#{@thread}")
  open("#{@directory}/#{@thread}.html", "w") do |file|
    file.write(index)
    end
end

def each_post(&block)
        @athread.each do |thread|
        thread.each do |threadt|
                threadt.each do |post|
             
                yield(post)
                end
                end
        end
end
def singlethread(num)
	puts "Api is http://api.4chan.org/#{@board}/res/#{num}.json"
    JsonParser::get("http://api.4chan.org/#{@board}/res/#{num}.json")
end
def each_thread(&block)

    @pages.each do |page|

      page['threads'].each do |thread|

        yield(thread)
      end

    end
  end

end
