class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def append(value)
    if @head == nil
      @head = Node.new(value)
    else
      current = @head
      new_node = Node.new(value)
      while current.next_node != nil
        current = current.next_node
      end
      current.next_node = new_node
    end
  end

  def prepend(value)
    if @head == nil
      @head = Node.new(value)
    else
      new_node = Node.new(value)
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size
    if @head == nil
      "linked list is empty"
    else
      count = 1
      current = @head
      while current.next_node != nil
        current = current.next_node
        count += 1
      end
      count
    end
  end

  def head
    @head
  end

  def tail
    current = @head
    while current.next_node != nil
      current = current.next_node
    end
    current
  end

  def at(index)
    array = []
    current = @head
    while current.next_node != nil
      array << current 
      current = current.next_node
    end
    array << current
    array[index]
  end

end