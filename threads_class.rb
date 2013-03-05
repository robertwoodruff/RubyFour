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
def download_thread(board, thread, directory)
  @thread = thread
  @board = board
  @directory = directory
  self.download_index
  each_post do |p|
  unless p["ext"].nil?
  download_image(p["tim"], p["ext"])
  end
end
end
def download_image(time, extension)
    open("#{@directory}/#{time}#{extension}", "w") do |file|
    file << open("http://images.4chan.org/#{@board}/src/#{time}#{extension}").read
  end
end

def download_index
  index = HttpWrapper::get("http://boards.4chan.org/#{@board}/res/#{@thread}")
  open("#{@directory}/#{@thread}.html", "w") do |file|
    file.write(index)
    end
end
end
