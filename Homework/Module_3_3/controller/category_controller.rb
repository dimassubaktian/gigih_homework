require_relative '../model/item'
require_relative '../model/category'

class CategoryController
    def index()
        categories = Category.get_all_categories

        renderer = ERB.new(File.read("./views/category/index.erb"))
        renderer.result(binding)
    end

    def create()
        renderer = ERB.new(File.read("./views/category/create.erb"))
        renderer.result(binding)
    end

    def store(params)
        category_model = Category.new(params['id'], params['name'])
        category_model.insert_category()
    end

    def edit(params)
        category_data = Category.edit_category(params['id'])

        renderer = ERB.new(File.read("./views/category/edit.erb"))
        renderer.result(binding)
    end

    def update(params)
        category_model = Category.new(params['id'], params['name'])
        category_model.update_category()
    end
    
    def delete(params)
        Category.delete_category(params['id'])
    end

    def items(params)
        item_data = Category.get_all_item_of_categories(params['id'])

        renderer = ERB.new(File.read("./views/category/show_item.erb"))
        renderer.result(binding)
    end
    
end