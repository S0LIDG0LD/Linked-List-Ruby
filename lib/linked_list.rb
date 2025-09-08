# frozen_string_literal: true

# A class implementing a Linked List in Ruby
class LinkedList
  def initialize
    @head = Node.new
  end

  attr_reader :head

  def tail
    current_node = @head
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node
  end

  def append(value)
    if @head.value.nil?
      @head.value = value
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node.nil?
      new_node = Node.new
      new_node.value = value
      current_node.next_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new
    new_node.value = value
    new_node.next_node = @head
    @head = new_node
  end

  def pop
    current_node = @head
    current_node = current_node.next_node until current_node.next_node.next_node.nil?
    current_node.next_node = nil
  end

  def at(index)
    current_index = 0
    current_node = @head
    until current_index == index
      return 'index not found' if current_node.next_node.nil?

      current_node = current_node.next_node
      current_index += 1
    end
    current_node
  end

  def insert_at(value, index)
    current_index = 0
    current_node = @head
    until current_index == index - 1
      return 'index not found' if current_node.next_node.nil?

      current_node = current_node.next_node
      current_index += 1
    end
    new_node = Node.new
    new_node.value = value
    new_node.next_node = current_node.next_node
    current_node.next_node = new_node
  end

  def remove_at(index)
    current_index = 0
    current_node = @head
    until current_index == index - 1
      return 'index not found' if current_node.next_node.next_node.nil?

      current_node = current_node.next_node
      current_index += 1
    end
    current_node.next_node = current_node.next_node.next_node
  end

  def find(value)
    current_index = 0
    current_node = @head
    until current_node.value == value
      return nil if current_node.next_node.nil?

      current_node = current_node.next_node
      current_index += 1
    end
    current_index
  end

  def contains?(value)
    current_node = @head
    until current_node.value == value
      return false if current_node.next_node.nil?

      current_node = current_node.next_node
    end
    true
  end

  def size
    size = 0
    current_node = @head
    until current_node.nil?
      current_node = current_node.next_node
      size += 1
    end
    size
  end

  def to_s
    to_s = ''
    current_node = @head
    until current_node.next_node.nil?
      to_s << "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    to_s << "( #{current_node.value} ) -> nil"
    to_s
  end
end
