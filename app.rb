require 'sinatra/base'
require './lib/bookmarks'

class Bookmarks < Sinatra::Base

  before do
    @bookmarks = BookmarkHolder.instance
  end

  get '/' do
    'Greetings'  
  end

  get '/bookmarks' do
    @bookmarks = BookmarkHolder.create
    erb :index
  end
  
  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/add_bookmark' do
    @bookmarks = BookmarkHolder.create
    @bookmarks.add_url(params['url_field'])
    redirect '/bookmarks'
  end
end