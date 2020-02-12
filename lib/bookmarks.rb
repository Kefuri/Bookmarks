require './lib/db_connection'

class BookmarkHolder 

    attr_reader :bookmarks, :bookmark_store, :cursor

    def initialize(database = 'bookmark_manager')
        @cursor = DBconnection.new(database, 'echo')
    end

    def all
        @cursor.create_connection
        result = @cursor.select_statement('SELECT * FROM bookmarks')
        @cursor.close_con
        result.map { |bookmark| bookmark['url']}
    end

    def self.create
        @bookmarks = BookmarkHolder.new
    end

    def self.instance
        @bookmarks
    end

end
