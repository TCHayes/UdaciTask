class TodoList
    # methods and stuff go here
    def initialize(list_title, user="default_user")
    	@title = list_title
    	@items = Array.new
        @user = user
    end

    attr_accessor :title, :items, :user

    def add_item(new_item)
    	item = Item.new(new_item)
    	@items.push(item)
    end

    def remove_item(item) #Requires user to enter item by index
        @items.delete_at(item)
    end

    def rename_list(new_name)
        @title = new_name
    end

    def toggle_completion_status(finished_item) #requires user to enter finished_item by index
        items[finished_item].completion_status = !items[finished_item].completion_status
    end

    def print_list
        unless Dir.exists?("#{user}") #Creates user directory if it doesn't already exist
            Dir.mkdir "#{user}"
        end
        fname = "#{user}/#{title}.txt" #Creates todo list file within user dir
        output = File.open(fname, "a") #Using argument "a" prevents existing lists from being overwritten
        output.puts "List created at: #{Time.now.getutc}" #Adds timestamp to list
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

    def print_item(count, natural_status, output_loc)
        output_loc.puts "#{count}: #{@description}: #{natural_status}"
    end

    attr_accessor :description, :completion_status

end
