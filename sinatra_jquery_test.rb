require 'sinatra'
require 'haml'

get '/' do
  haml :app
end

get '/cheer/:name' do |name|
  puts name
  puts params[:name]
  "<h1>Hello #{name}</h1>"
end

