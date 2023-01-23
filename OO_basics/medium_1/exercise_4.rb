=begin
  Enqueue - add object to queue
    - When added, added to position immediately following most recently added.
    - If full, must remove oldest object and add the new one. 
  Dequeue
    - Removing object always removes object in the queue the longest (i.e. the first object here)

When we initialise - want to set the buffer array to [nil] * length

class CircularQueue
  attr_accessor :buffer

  def initialize(length)
    @buffer = [nil] * length
  end

  def enqueue(item)
    if buffer.include?(nil)
      index = buffer.index(nil)
      buffer[index] = item
    else 
      buffer.shift
      buffer.push(item)
    end
  end

  def dequeue
    buffer.push(nil)
    buffer.shift
  end
end
=end

class CircularQueue
  def initialize(size)
    @buffer = [nil] * size
    @next_position = 0
    @oldest_position = 0
  end

  def enqueue(object)
    unless @buffer[@next_position].nil?
      @oldest_position = increment(@next_position)
    end

    @buffer[@next_position] = object
    @next_position = increment(@next_position)
  end

  def dequeue
    value = @buffer[@oldest_position]
    @buffer[@oldest_position] = nil
    @oldest_position = increment(@oldest_position) unless value.nil?
    value
  end

  private

  def increment(position)
    (position + 1) % @buffer.size
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil