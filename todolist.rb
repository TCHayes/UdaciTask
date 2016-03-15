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

    def remove_item(item) #requires user to enter item by index
        @items.delete_at(item)
    end

    def rename_list(new_name)
        @title = new_name
    end

    def toggle_completion_status(finished_item) #requires user to enter finished_item by index
        items[finished_item].completion_status = !items[finished_item].completion_status
    end

    def print_list
        fname = "#{title}.txt"
        output = File.open(fname, "w")
        output.puts "=" * @title.length
        output.puts @title
        output.puts "=" * @title.length
        count = 1
        @items.each do |item|
            if item.completed?
                natural_status = "Complete"
            else
                natural_status = "Incomplete"
            end
            item.print_item(count, natural_status, output)
            count = count + 1
        end
        output.puts "\n"
        output.close
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

    def print_item(count, natural_status, output_variable)
        output_variable.puts "#{count}: #{@description}: #{natural_status}"
    end

    attr_accessor :description, :completion_status

end
