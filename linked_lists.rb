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
    return nil if @head == nil
    current = @head
    while current.next_node != nil
      array << current 
      current = current.next_node
    end
    array << current
    array[index]
  end

  def pop
    if @head == nil
      nil
    else
      tail = self.tail
      current = @head
      while current.next_node != tail
        current = current.next_node
      end
      current.next_node = nil
    end
  end
  
  def contains?(value)
    array = []
    if @head == nil
      false
    else
      current = @head
      while current.next_node != nil
        array << current.value 
        current = current.next_node
      end
      array << current.value
      array.include?(value)
    end
  end

  def find(value)
    array = []
    if @head == nil
      nil
    else
      current = @head
      while current.next_node != nil
        array << current 
        current = current.next_node
      end
      array << current
      array.each_with_index do |node, index|
        return index if node.value == value
      end
      nil if self.contains?(value) == false
    end
  end

  def to_s
    string = ''
    array = []
    if @head == nil
      'List is empty'
    else
      current = @head
      while current.next_node != nil
        array << current 
        current = current.next_node
      end
      array << current
      array.each_with_index do |node, index|
        if index == 0
          string += "(#{node.value}) "
        else
          string += "-> " + "(#{node.value}) "
        end
      end
      string += "-> nil"
      string
    end
  end

  def insert_at(value, index)
    if @head == nil
      @head = Node.new(value)
    elsif index == 0
      self.prepend(value)
    elsif
      node = self.at(index)
      new_node = Node.new(value)
      current = @head
      while current.next_node != node
        current = current.next_node
      end
      current.next_node = new_node
      new_node.next_node = node
    end
  end

  def remove_at(index)
    node = self.at(index)
    if index == 0
      current = @head
      @head = current.next_node
    else
      current = @head
      while current.next_node != node
        current = current.next_node
      end
      current.next_node = node.next_node
    end
  end
end