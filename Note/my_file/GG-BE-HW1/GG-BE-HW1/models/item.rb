require_relative '../db/db_connector'

client = create_db_client

class Item
  attr_reader :id, :name, :price, :category

  def initialize(id, name, price, category = nil)   
    @id = id,
    @name = name,
    @price = price,   
    @category = category  
  end

  def get_all_items
    rawData = client.query("SELECT * FROM items")
    items = Array.new
    rawData.each do |data|
      items.push(Item.new(data["id"], data["name"], data["price"]))
    end
    items  
  end

  def get_all_items_with_category
   
    rawData = client.query("SELECT items.id, items.name, items.price, categories.name AS category_name, categories.id AS category_id
      FROM items
      LEFT JOIN categories ON items.category_id = categories.id")
    items = Array.new
    rawData.each do |data|
      category = Category.new(data["category_id"], data["category_name"])
      item = Item.new(data["id"], data["name"], data["price"], category)
      items.push(item)
    end
    items
  end

  def get_item_by_id(id)
    rawDataItem = client.query("SELECT * FROM items WHERE id = '#{id}")
    rawDataCategory = client.query("SELECT * FROM categories WHERE id = '#{rawDataItem["category_id"]}")
    category = get_category_by_id(rawDataCategory["id"])
    item = Item.new(rawDataItem["id"], rawDataItem["name"], rawDataItem["price"], category)
    item
  end

  def delete
    client.query("DELETE FROM items WHERE id = '#{id}")
  end

  def save(name, price, category_id)
    client.query("INSERT INTO items (name, price, category_id) VALUES ('#{name}', '#{price}', #{category_id})")
  end

  def update(name, price, category_id)
    client.query("UPDATE items SET name = '#{name}', price = '#{price}', WHERE id = '#{category_id}')
  end

end