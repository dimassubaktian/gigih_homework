require_relative '../model/item'
require_relative '../model/category'

class ItemController
    def index()
        items = Item.get_all_item_categories

        renderer = ERB.new(File.read("./views/index.erb"))
        renderer.result(binding)
    end

    def create()
        categories = Category.get_all_categories

        renderer = ERB.new(File.read("./views/create.erb"))
        renderer.result(binding)
    end

    def store(params)
        item_model = Item.new(params['id'], params['name'], params['price'], params['category'])
        item_model.insert_item()
    end

    def edit(params)
        categories  = Category.get_all_categories
        item_data = Item.edit_item(params['id'])

        renderer = ERB.new(File.read("./views/edit.erb"))
        renderer.result(binding)
    end

    def update(params)
        item_model = Item.new(params['id'], params['name'], params['price'], params['category'])
        item_model.update_item()
    end

    def detail(params)
        item_data = Item.detail_item(params['id'])

        renderer = ERB.new(File.read("./views/detail.erb"))
        renderer.result(binding)
    end

    def delete(params)
        Item.delete_item(params['id'])
    end
end