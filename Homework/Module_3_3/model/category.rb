require 'mysql2'
require_relative '../database/db_connector'
require_relative '../model/item'

class Category
    attr_reader :id, :name

    def initialize(id, name)
        @id = id
        @name = name
    end

    def self.get_all_categories
        client = create_db_client
        rawData = client.query("SELECT * FROM categories WHERE is_delete=false")
        categories = Array.new
        rawData.each do |data|
            category = Category.new(data["id"], data["name"])
            categories.push(category)
        end
        categories
    end

    def insert_category()
        client = create_db_client
        client.query("INSERT INTO categories (name) VALUES ('#{@name}')")
    end

    def self.edit_category(id)
        client = create_db_client
        category_data = client.query("SELECT * FROM categories
            WHERE id = #{id}")
        category_data
    end

    def update_category()
        client = create_db_client
        client.query("UPDATE categories
            SET name = '#{@name}' 
            WHERE id = #{@id}"
        )
    end

    def self.delete_category(id)
        client = create_db_client
        client.query("UPDATE categories
            SET is_delete = 'true'
            WHERE id = #{id}"
        )
        client.query("UPDATE item_categories
            SET is_delete = 'true'
            WHERE category_id = #{id}"
        )
    end

    def self.get_all_item_of_categories(id)
        client = create_db_client
        rawData = client.query("SELECT i.id, i.name, i.price
            FROM items i
            JOIN item_categories ic ON ic.item_id = i.id
            WHERE i.is_delete = 'false'
            AND ic.is_delete = 'false'
            AND ic.category_id = #{id}
            GROUP BY i.name"
        )
        items_data = Array.new
        rawData.each do |data|
            item_data = Item.new(data["id"], data["name"], data['price'])
            items_data.push(item_data)
        end
        items_data
    end
end
