require 'sinatra'

get '/' do
  erb :app
end

get '/play' do 
  if request.xhr?
    %q{<h1 class="blue">Hello! <a href="/">back</a></h1>}
  else
    "<h1>Not an Ajax request!</h1>"
  end
end

