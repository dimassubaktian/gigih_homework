require_relative '../model/item'

class ItemController
    def index()
        items = Item.get_all_item_categories

        renderer = ERB.new(File.read("./views/index.erb"))
        renderer.result(binding)
    end
end