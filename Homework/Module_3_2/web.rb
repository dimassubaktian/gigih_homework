require 'sinatra'
require_relative 'db_connector'

get '/' do
    items = get_all_items_with_category
    erb :index, locals: {
        items: items
    }
end

get '/items/new' do
    categories = get_all_category
    erb :create, locals: {
        categories: categories
    }
end

post '/items/create' do
  name = params['name']
  price = params['price']
  category_id = params["category"]
  puts(category_id)
  insert_item(name, price, category_id)
  redirect '/'
end 

delete '/items/delete/:id' do
 puts("awlnawlnlawdawdawda")
 redirect '/'
end