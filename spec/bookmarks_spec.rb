require './lib/bookmarks'

describe BookmarkHolder do
  describe '#all' do
    it "should return current test bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
      bookmark = BookmarkHolder.new('bookmark_manager_test')
      result = bookmark.all

      expect(result).to include("http://www.makersacademy.com")
      expect(result).to include("http://www.destroyallsoftware.com")
    end
  end
  describe '#add_url' do
    it 'should add a url to the database' do
      bookmark =  BookmarkHolder.new('bookmark_manager_test')
      bookmark.add_url("https://www.reddit.com")
      result = bookmark.all
      expect(result).to include("https://www.reddit.com")
    end
  end
end