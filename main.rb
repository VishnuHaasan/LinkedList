class Node
  attr_accessor :next_node,:value
  def initialize(value,node=nil)
    @value = value
    @next_node = node
  end
end

class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @count = 0
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @head.next_node = @tail
      @tail = @head
      @count = 1
    else  
      @tail.next_node = new_node
      @tail = new_node
      @count += 1
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @head.next_node = @tail
      @tail = @head
      @count = 1
    else  
      new_node.next_node = @head
      @head = new_node
      @count += 1
    end
    
  end

  def size
    return @count
  end

  def head
    return @head unless @head.nil?
    puts "The list is empty"
  end

  def tail
    return @tail unless @tail.nil?
    puts "The list is empty"
  end

  def at(index)
    temp = @head
    while index>0 && temp!=nil do
      temp = temp.next_node
      index-=1
    end
    if temp.nil?
      return "Invalid index"
    else
      return temp 
    end
  end

  def pop
    if @tail.nil?
      puts "List underflow"
    elsif @head == @tail
      @head = nil
      @tail = nil
      @count = 0
    else  
      temp = @head
      while temp.next_node != @tail do
        temp = temp.next_node
      end
      temp.next_node = nil
      @tail = temp
      @count -=1
    end
  end

  def contains?(value)
    if @head.nil?
      return false
    else  
      temp = @head
      while temp != nil do
        return true if temp.value == value
        temp = temp.next_node
      end
    end
    return false
  end

  def find(value)
    index = "nil"
    k = 0
    temp = @head
    if @head == @tail
      if @head.value == value
        return 0
      else  
        return "nil"
      end
    end
    while temp != nil do
      index = k.to_i if temp.value == value
      k+=1
      temp = temp.next_node
    end
    return index 
  end

  def to_s
    string = String.new
    temp = @head
    while temp!=nil  do
      string += "(#{temp.value}) -> "
      temp = temp.next_node
    end
    string += "nil"
    return string
  end

  def insert_at(value,index)
    if index == 0
      if @head == @tail && !@head.nil?
        new_node = Node.new(value)
        new_node.next_node = @head
        @tail = @head
        @head = new_node
      elsif @head.nil?
        new_node = Node.new(value)
        @head = new_node
        @head.next_node = @tail
        @tail = @head
      else
        new_node = Node.new(value)
        new_node.next_node = @head
        @head = new_node
      end
      @count+=1
      return "Success"
    end
    temp = @head
    while temp!=nil && index>1 do
      temp = temp.next_node
      index-=1
    end
    if temp.nil?
      return "Invalid Index"
    else  
      new_node = Node.new(value)
      new_node.next_node = temp.next_node
      temp.next_node = new_node
      @tail = new_node if @tail == temp
      @count+=1
      return "Success"
    end
  end
end

list = LinkedList.new
list.append(100)
list.prepend(200)
puts list.size
puts list.head.value
puts list.tail.value
puts list.at(0)
puts list.pop
puts list.contains?(200)
puts list.find(100)
puts list.insert_at(20,0)
puts list.to_s 