require_relative "todolist"

# Creates a new todo list
march_todos = TodoList.new("March To-do List", "Terry")

# Add four new items
march_todos.add_item("Finish Udacity Task Manager")
march_todos.add_item("Buy Groceries")
march_todos.add_item("Finish Work Project")
march_todos.add_item("Rebalance Investments")

# Print the list
march_todos.print_list

# Delete the first item
march_todos.remove_item(0)

# Print the list
march_todos.print_list

# Delete the second item
march_todos.remove_item(1)

# Print the list
march_todos.print_list

# Update the completion status of the first item to complete
march_todos.toggle_completion_status(0)

# Print the list
march_todos.print_list

# Update the title of the list
march_todos.rename_list("Early March To-dos")

# Print the list
march_todos.print_list