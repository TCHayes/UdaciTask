class TodoList
    # methods and stuff go here
    def initialize(list_title)
    	@title = list_title
    	@items = Array.new
    end

    attr_reader :title, :items

    def add_item(new_item)
    	item = Item.new(new_item)
    	@items.push(item)
    end

    def remove_item(item)
        @items.delete(item) # Correct method?
    end

    def rename_list(new_name)
        @title = new_name
    end

    def toggle_completion_status(finished_item)
        finished_item[:completion_status] = !finished_item["completion_status"] # how to reference correct item and item attribute?
    end

    def print_list
        puts @items #Still need to make the output look pretty
    end


end

class Item
    # methods and stuff go here
    def initialize(item_description)
    	@description = item_description
    	@completion_status = false
    end

    def completed?
        @completion_status
    end
end
