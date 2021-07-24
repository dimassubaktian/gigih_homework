
# def get_all_item_categories_price(price)
#     client = create_db_client
#     items = client.query("SELECT i.name, c.name, i.price FROM items i LEFT JOIN item_categories ic ON ic.item_id = i.id LEFT JOIN categories c ON c.id = ic.category_id WHERE i.price < #{price}")
# end

# items = get_all_items()
# categories = get_all_categories()
# item_categories = get_all_item_categories()

# puts(items.each)
# puts('======# 1=======')
# puts(categories.each)
# puts('======# 2=======')
# print item_categories
# puts(item_categories.each)
# puts('======# 3=======')
# puts "Enter The Price: "
# prices = gets.chomp.to_i
# item_categories_price = get_all_item_categories_price(prices)
# puts(item_categories_price.each)


