class Stack
    def initialize
        @underlying_array = []
    end

    def push(el)
        underlying_array.push(el)
        el
    end

    def pop
        underlying_array.pop
    end

    def peek
        underlying_array.last
    end

    private

    attr_reader :underlying_array
end

# s = Stack.new
# p s
# p s.push(4)
# p s.push(8)
# p s.push(2)
# p s.pop
# p s.peek
# p s


class Queue
    def initialize
        @underlying_array = []
    end

    def enqueue(el)
        underlying_array.push(el)
        el
    end

    def dequeue
        underlying_array.shift
    end

    def peek
        underlying_array.first
    end

    private

    attr_reader :underlying_array
end

# p q = Queue.new
# p q
# p q.enqueue(5)
# p q.enqueue(7)
# p q.enqueue(3)
# p q.dequeue
# p q.peek
# p q

class Map
    def initialize
        @underlying_array = []
    end

    def set(key, value)
        pair_index = underlying_array.index { |pair| pair[0] == key }
        if pair_index
            underlying_array[pair_index][1] = value
        else
            underlying_array.push([key, value])
        end
        value
    end

    def get(key)
        underlying_array.each { |pair| return pair[1] if pair[0] == key }
        nil
    end

    def delete(key)
        value = get(key)
        underlying_array.reject! { |pair| pair[0] == key }
        value
    end

    def show
        deep_dup(underlying_array)
    end

    private

    attr_reader :underlying_array

    def deep_dup(arr)
        arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
    end
end

# m = Map.new
# p m.show
# m.set(1, "Hello")
# m.set(2, "Amazing")
# m.set(3, "World")
# p m.show
# p m.get(2)
# p m.get(1)
# p m.get(3)
# p m.delete(2)
# p m.show