require "byebug"
class Library
  attr_reader :authors, :books

  def initialize
    initialize_storages
  end

  def add_author(author)
    @authors.push(author)
  end

  def add_book(book)
    @books.push(book)
  end

  def add_reader(reader)
    @readers.push(reader)
  end

  def add_order(order)
    @orders.push(order)
  end

  def top_readers
    orders_grouped_by_reader = orders_grouped_by(:reader)
    sorted_orders = sort_grouped_orders(orders_grouped_by_reader)
    sorted_orders.keys
  end

  def top_books
    orders_grouped_by_book = orders_grouped_by(:book)
    sorted_orders = sort_grouped_orders(orders_grouped_by_book)
    sorted_orders.keys
  end

  def top_reader
    top_readers.first
  end

  def top_book
    top_books.first
  end

  def top_books_readers_count
    readers = []
    orders_grouped_by_book = orders_grouped_by(:book)
    top_books[0..2].each do |book|
      orders_grouped_by_book[book].each do |order|
        readers.push(order.reader)
      end
    end
    readers.uniq.size
  end

  private

  def initialize_storages
    @authors = []
    @books = []
    @readers = []
    @orders = []
  end

  def orders_grouped_by(key)
    @orders.group_by do |order|
      order.public_send(key)
    end
  end

  def sort_grouped_orders(orders)
    sorted_orders = orders.sort_by do |k, v|
      v.size
    end
    sorted_orders.reverse.to_h
  end

end
