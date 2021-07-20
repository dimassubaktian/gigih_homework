require 'rubygems'
require 'sinatra'

get '/messages' do
    
    erb :messages, locals: {
        color: 'DodgerBlue',
        name: 'World'
    }
end

get '/messages/:name' do
    name = params['name']
    name = params['name']
    "Hello #{name}"
end

get '/login' do
    erb :messages, locals: {
        color: 'DodgerBlue',
        name: 'World'
    }
end


get '/item' do
    erb :item
end

post '/item' do
    
end