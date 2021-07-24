require 'mysql2'
require 'dotenv/load'
require_relative 'item'
require_relative 'category'

def create_db_client
  client = Mysql2::Client.new(
      :host => "localhost",
      :username => ENV['USERNAME'],
      :password => ENV['PASSWORD'],
      :database => ENV['DB_NAME']
  )
  client
end

def get_all_category
  client = create_db_client
  rawData = client.query("select * from categories")
  categories = Array.new
  rawData.each do |data|
    category = Category.new(data["id"], data["name"])
    categories.push(category)
  end
  categories
end



def get_all_items_by_price(price)
  client = create_db_client
  items = client.query("SELECT * FROM items WHERE price > #{price}")  
end



def insert_item(name, price, category_id)
  client = create_db_client
  puts(category_id)
  puts("oKEEEEE")
  client.query("INSERT INTO items (name, price, category_id) VALUES ('#{name}', '#{price}', #{category_id})")
  puts("#{name}, #{price} and #{category_id} already added to data")
end

def delete_item(id)
client = create_db_client
client.query("DELETE FROM items WHERE id = #{id}")
end




# categories = get_all_category()

# items = get_all_items()

# categories.each do |category|
#  puts ("#{category.name}")
# end
# puts("===============")
# puts(items.each)
# puts("===============")
# puts(items_by_price.each)
