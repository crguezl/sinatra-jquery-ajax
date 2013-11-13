require 'sinatra'

get '/' do
  erb :app
end

get '/play' do 
  %q{<h1>Hello! <a href="/">back</a></h1> 
  }
end

