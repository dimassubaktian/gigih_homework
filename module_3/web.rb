require 'sinatra'
require 'rubygems'
require_relative './dbconnector'

get '/' do
    items = get_all_item_categories
    erb :index, locals:{
        items:items
    }
end

get '/items/create' do 
    categories  = get_all_categories

    erb :create, locals:{
        categories:categories
    }
end

post '/items/store' do
    id = params['id']
    name = params['name']
    price = params['price']
    category = params['category']
    insert_item(name, price, category)
    redirect '/'
end

get '/items/edit' do
    id = params['id']
    categories  = get_all_categories
    item_data = edit_item(id)
    erb :edit, locals:{
        categories:categories,
        item_data:item_data
    }
end

get '/items/detail' do
    id = params['id']
    categories  = get_all_categories
    item_data = detail_item(id)
    erb :detail, locals:{
        categories:categories,
        item_data:item_data
    }
end

get '/items/delete' do
    id = params['id']
    delete_item(id)
    redirect '/'
end

post '/items/update' do
    id = params['id']
    name = params['name']
    price = params['price']
    category = params['category']
    update_item(id, name, price, category)
    redirect '/'
end