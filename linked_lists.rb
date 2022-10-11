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

end