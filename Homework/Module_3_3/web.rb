require 'sinatra'
require 'rubygems'
# require_relative './model/item'
# require_relative './model/category'
require_relative './controller/item_controller'
require_relative './controller/category_controller'

get '/' do
    item = ItemController.new
    item.index
end

get '/items/create' do 
    categories = ItemController.new
    categories.create
end

post '/items/store' do
    item = ItemController.new
    item.store(params)
    redirect '/'
end

get '/items/edit' do
    item = ItemController.new
    item.edit(params)
end

post '/items/update' do
    item = ItemController.new
    item.update(params)
    redirect '/'
end

get '/items/detail' do
    item = ItemController.new
    item.detail(params)
end

get '/items/delete' do
    item = ItemController.new
    item.delete(params)
    redirect '/'
end

# Category

get '/categories' do
    category = CategoryController.new
    category.index
end

get '/categories/create' do
    category = CategoryController.new
    category.create()
end

post '/categories/store' do
    category = CategoryController.new
    category.store(params)
    redirect '/categories'
end

get '/categories/edit' do
    category = CategoryController.new
    category.edit(params)
end

post '/categories/update' do
    category = CategoryController.new
    category.update(params)
    redirect '/categories'
end

get '/categories/delete' do
    category = CategoryController.new
    category.delete(params)
    redirect '/categories'
end

get '/categories/item' do
    category = CategoryController.new
    category.items(params)
end