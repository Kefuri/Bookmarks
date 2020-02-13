require 'db_connection'

describe DBconnection do
  describe '#create_connection' do
    it "should create a connection" do
      allow(PG).to receive(:connect) {"Received"}
      bookmark = BookmarkHolder.new('bookmark_manager_test')
      expect(bookmark.cursor.create_connection).to eq "Received"
    end
  end
end