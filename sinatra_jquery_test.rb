require 'sinatra'
require 'dm-core'
require 'dm-migrations'
require 'haml'

#DataMapper.setup(:default, 'sqlite3::memory:')
DataMapper.setup :default, "sqlite://#{Dir.pwd}/database.db"

class Message
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :message, String
end

Message.auto_migrate!

get '/' do
  haml :app
end

post '/new' do
  @message = Message.new
  @message.message = "#{params[:will]} will #{params[:you]} you"
  @message.save
  
  @message.message
end

