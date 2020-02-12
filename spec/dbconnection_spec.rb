require 'db_connection'

describe DBconnection do
  describe '#create_connection' do
    it "should create a connection" do
      allow(PG).to receive(:connect) {"Received"}
      expect(subject.create_connection).to eq "Received"
    end
  end

  describe "#select_statement" do
  