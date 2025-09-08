# frozen_string_literal: true

require_relative 'lib/node'
require_relative 'lib/lined_list'

list = LinkedList.new
list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')
puts list
list.insert_at('cat', 4)
list.print_list
list.size
list.head
list.tail
list.at(4)
