require 'db_connector.rb'

client = create_db_client

class Category
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def get_all_categories
    rawData = client.query("SELECT * FROM categories")
    categories = Array.new
    rawData.each do |data|
      categories.push(Category.new(data["id"], data["name"]))
    end
    categories
  end

  def get_category_by_id(id)
    rawData = client.query("SELECT * FROM categories where id = '#{id}")
    category = Category.new(data["id"], data["name"])
  end
end