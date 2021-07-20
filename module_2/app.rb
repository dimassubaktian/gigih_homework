require 'rubygems'
require 'sinatra'

item = [] 

get '/item' do
    erb :item
end

post '/item' do
    name = params['nama']
    harga = params['harga']

    item.push("#{name} & #{harga}")
    item.each do |variable|
        "#{variable}"
     end
end