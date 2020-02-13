require './lib/db_connection'

class BookmarkHolder 

  attr_reader :bookmarks, :bookmark_store, :cursor

  def initialize(database = 'bookmark_manager')
   @cursor = DBconnection.new(database, 'echo')
  end

  def all
    @cursor.create_connection
    result = @cursor.exec_statement('SELECT * FROM bookmarks')
    @cursor.close_con
    result.map { |bookmark| bookmark['url']}
  end

  def add_url(url)
    @cursor.create_connection
    @cursor.exec_statement("INSERT INTO bookmarks(url) VALUES('#{url}')")
    @cursor.close_con
  end

  def self.create
    @bookmarks = BookmarkHolder.new
  end

  def self.instance
    @bookmarks
  end
end
