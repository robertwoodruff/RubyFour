class Threads
  def initialize(threadno, board)
    @threadno = threadno
    @board = board
    @json = JsonParser::get("api.4chan.org/#{board}/#{threadno}.json")
  end

  def download_thread(directory)
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

def each_post(&block)
  @json.each do |thread|
      thread.each do |allposts|
                allposts.each do |post|
                yield(post)
                end
              end
           end
end


end
