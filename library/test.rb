require "date"
Dir["./lib/*.rb"].each {|file| require file }

# Creating library instance
library = Library.new

# Creating Author instances
author = Author.new("Eric", "Brovko")
library.add_author(author)

# Creating Book instances
book = Book.new("Merlin Monroe", author)
library.add_book(book)

second_book = Book.new("Moo Moo", author)
library.add_book(second_book)

# Creating Reader instances
reader = Reader.new("Kirill", "myemalcool@gmail.com", "Dnipropetrovsk", "New Year street", 54)
second_reader = Reader.new("Eric", "myemalcool@gmail.com", "Dnipropetrovsk", "New Year street", 54)

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
puts library.top_books_readers_count
