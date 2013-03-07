require './threads_class'
class FourChan

  def initialize(board)
    @board = board
  end


  def search_for(terms)
    @threadlist = []
    @threadlist = Threads.new(board).search_for(terms)
  end
  
  def archive_threads(directory)
    @threadlist.each do |thread|
	Threads.new(thread, @board).download_thread(directory)
    end
  end
  
  def list
    if @threadlist.is_a? Array
    @threadlist.each do |t|
    puts t
    end
  end
    
  end
  
  def archive_board
  Boards.new(@board).archive_board
  end
  
end
