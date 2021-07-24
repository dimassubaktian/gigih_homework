require 'mysql2'
require_relative '../database/db_connector'
require_relative '../model/category'

class Item
    attr_reader :id, :name, :price, :category

    def initialize(id, name, price, category=[])
        @id = id
        @name = name
        @price = price
        @category = category
    end

    def self.get_all_items
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
            WHERE c.is_delete = 'false'
            AND i.is_delete = 'false'
            AND ic.is_delete = 'false'"
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
        return false unless valid?
        client = create_db_client
        client.query("INSERT INTO items (name, price) VALUES ('#{@name}', #{@price})")
        last_id = client.last_id
        @category.each do |data|
        client.query("INSERT INTO item_categories (item_id, category_id) VALUES (#{last_id}, #{data})")
        end
        true
    end
    
    def self.edit_item(id)
        client = create_db_client
        item_data = client.query("SELECT i.*, GROUP_CONCAT(ic.category_id) as category_id
            FROM items i 
            LEFT JOIN item_categories ic ON ic.item_id = i.id
            WHERE i.id = #{id}
            AND ic.is_delete = 'false'
            GROUP BY i.id")
        item_data
    end 
    
    def self.detail_item(id)
        client = create_db_client
        item_data = client.query(
            "SELECT i.id, i.name as 'name', GROUP_CONCAT(c.name SEPARATOR ', ') as 'category_name', i.price, c.id as 'category_id' 
            FROM items i 
            LEFT JOIN item_categories ic ON ic.item_id = i.id 
            LEFT JOIN categories c ON c.id = ic.category_id
            WHERE i.id = #{id}
            AND ic.is_delete = 'false'
            GROUP BY i.name"
        )
        item_data
    end 
    
    def update_item()
        return false unless valid?
        client = create_db_client
        client.query("UPDATE items
            SET name = '#{@name}', 
                price = '#{@price}'
            WHERE id = #{@id}"
        )
        client.query("UPDATE item_categories
            SET is_delete = 'true'
            WHERE item_id = #{@id}"
        )

        @category.each do |data|
            client.query("INSERT INTO item_categories (item_id, category_id) VALUES (#{@id}, #{data})")
        end
    end
    
    def self.delete_item(id)
        client = create_db_client
        client.query("UPDATE items
            SET is_delete = 'true'
            WHERE id = #{id}"
        )
        client.query("UPDATE item_categories
            SET is_delete = 'true'
            WHERE item_id = #{id}"
        )
    end

    def valid?
        return false if @category.nil?
        true
    end

end