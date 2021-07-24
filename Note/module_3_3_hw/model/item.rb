require 'mysql2'
require_relative '../database/db_connector'
require_relative '../model/category'

class Item
    attr_reader :id, :name, :price, :category

    def initialize(id, name, price, category=nil)
        @id = id
        @name = name
        @price = price
        @category = category
    end

    def get_all_items
        client = create_db_client
        rawData = client.query("SELECT * FROM items WHERE is_delete = 'false'")
        items = Array.new
        rawData.each do |data|
            item = Item.new(data["id"], data["name"], data["price"])
            items.push(item)
        end
        items
    end

    def self.get_all_item_categories
        client = create_db_client
        rawData = client.query(
            "SELECT i.id, i.name as 'name', c.name as 'category_name', i.price, c.id as 'category_id' 
            FROM items i 
            LEFT JOIN item_categories ic ON ic.item_id = i.id 
            LEFT JOIN categories c ON c.id = ic.category_id
            WHERE i.is_delete = 'false'"
        )
        items = Array.new
        rawData.each do |data|
            category = Category.new(data["category_id"], data["category_name"])
            item = Item.new(data["id"], data["name"], data["price"], category)
            items.push(item)
        end
        items
    end
    
    def insert_item()
        client = create_db_client
        client.query("INSERT INTO items (name, price) VALUES ('#{@name}', #{@price})")
        last_id = client.last_id
        client.query("INSERT INTO item_categories (item_id, category_id) VALUES (#{last_id}, #{@category})")
    end
    
    def self.edit_item(id)
        client = create_db_client
        item_data = client.query("SELECT i.*, ic.category_id 
            FROM items i 
            LEFT JOIN item_categories ic ON ic.item_id = i.id
            WHERE i.id = #{id}")
        item_data
    end 
    
    def self.detail_item(id)
        client = create_db_client
        item_data = client.query(
            "SELECT i.id, i.name as 'name', c.name as 'category_name', i.price, c.id as 'category_id' 
            FROM items i 
            LEFT JOIN item_categories ic ON ic.item_id = i.id 
            LEFT JOIN categories c ON c.id = ic.category_id
            WHERE i.id = #{id}"
        )
        item_data
    end 
    
    def update_item()
        client = create_db_client
        client.query("UPDATE items
            SET name = '#{@name}', 
                price = '#{@price}'
            WHERE id = #{@id}"
        )
        client.query("UPDATE item_categories
            SET category_id = '#{@category}'
            WHERE item_id = #{@id}"
        )
    end
    
    def self.delete_item(id)
        client = create_db_client
        client.query("UPDATE items
            SET is_delete = 'true'
            WHERE id = #{id}"
        )
    end

end