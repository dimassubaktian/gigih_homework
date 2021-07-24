require 'sinatra'
require 'rubygems'
require_relative './model/item'
require_relative './model/category'

get '/' do
    items = Item.get_all_item_categories
    erb :index, locals:{
        items:items
    }
end

# get '/items/create' do 
#     categories  = Category.get_all_categories

#     erb :create, locals:{
#         categories:categories
#     }
# end

# post '/items/store' do
#     id = params['id']
#     name = params['name']
#     price = params['price']
#     category = params['category']
#     item_model = Item.new(id, name, price, category)
#     item_model.insert_item()
#     redirect '/'
# end

# get '/items/edit' do
#     id = params['id']
#     categories  = Category.get_all_categories
#     item_data = Item.edit_item(id)
#     erb :edit, locals:{
#         categories:categories,
#         item_data:item_data
#     }
# end

# post '/items/update' do
#     id = params['id']
#     name = params['name']
#     price = params['price']
#     category = params['category']
#     item_model = Item.new(id, name, price, category)
#     item_model.update_item()
#     redirect '/'
# end

# get '/items/detail' do
#     id = params['id']
#     categories  = Category.get_all_categories
#     item_data = Item.detail_item(id)
#     erb :detail, locals:{
#         categories:categories,
#         item_data:item_data
#     }
# end

# get '/items/delete' do
#     id = params['id']
#     Item.delete_item(id)
#     redirect '/'
# end

