class TodoList
    # methods and stuff go here
    def initialize(list_title)
    	@title = list_title
    	@items = Array.new
    end

    attr_accessor :title, :items

    def add_item(new_item)
    	item = Item.new(new_item)
    	@items.push(item)
    end

    def remove_item(item)
        @items.delete_at(item)
    end

    def rename_list(new_name)
        @title = new_name
    end

    def toggle_completion_status(finished_item)
        items[finished_item].completion_status = !items[finished_item].completion_status
        #Need to select finished_item out of array
    end

    def print_list
        puts "*" * @title.length
        puts @title
        puts "*" * @title.length
        count = 1
        @items.each do |item|
            puts "#{count}: #{item.description}: #{item.completion_status}"
            count = count + 1
        end
        puts "\n"
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

    attr_accessor :description, :completion_status

end
