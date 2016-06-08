require "date"
Dir["./lib/*.rb"].each {|file| require file }

# Creating library instance
library = Library.new

# Creating Author instances
author = Author.new("Joseph", "Jacobs")
library.add_author(author)

# Creating Book instances
book = Book.new("The Three Sillies", author)
library.add_book(book)

second_book = Book.new("Paddy O'Kelly and the Weasel", author)
library.add_book(second_book)

# Creating Reader instances
reader = Reader.new("Kirill", "kirillcool@gmail.com", "Dnipropetrovsk", "New Year street", 55)
second_reader = Reader.new("Eric", "ericcool@gmail.com", "Dnipropetrovsk", "New Year street", 54)

library.add_reader(reader)

# Creating Order instances
order = Order.new(book, reader, Date.today)
library.add_order(order)
library.add_order(order)
library.add_order(order)
second_order = Order.new(second_book, second_reader, Date.today)
library.add_order(second_order)
library.add_order(second_order)

# puts library.top_reader.name
# puts library.top_book.title
# puts library.top_books_readers_count

# library.save_lib_data('test')
# library.load_lib_data('file_does_not_exist')
# library.load_lib_data('test')
