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

__END__

@@ app
%html
  %head
    %title Sinatra JQuery Test
    %script{:type => 'text/javascript', :src => 'http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js'}
    :javascript
      $(document).ready(function() {
        $('#new_message').submit(function() {
          $.post($(this).attr('action'), $(this).serialize(), function(data){
            $('#message').append("<p>" + data + "</p>");
            $('#new_message').each(function(){this.reset();});
          }, "text");
          return false;
        });
      });
  %body
    #footer
      %h2 leave your message
      #message
      %form#new_message{:action => '/new'}
        %p
          %input.pink{:type => "text", :id => "will", :name => "will"}
          %strong will
          %input.pink{:type => "text", :id => "you", :name => "you"}
          %strong you
          %input{:type => "submit", :value => "post!"}

