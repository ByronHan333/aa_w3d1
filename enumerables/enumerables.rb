# https://www.rubyguides.com/2019/12/yield-keyword/
# yield calls the block is given, when no block given, error
#  use yield if block_given?
class Array
  def my_each(&prc)
    i = 0
    while i < self.length
        prc.call(self[i])
        i += 1
    end
    self
  end

  def my_select(&prc)
    res = []
    self.my_each{|e| res << e if yield e}
    res
  end

  def my_reject(&prc)
    res= []
    self.my_each{|e| res << e if !yield e}
    res
  end

  def my_any?(&prc)
    self.my_each{|e| return true if yield e}
    false
  end

  def my_all?
    self.my_each{|e| return false if !yield e}
    true
  end

  def my_flatten
    flattened = []
    self.my_each do |el|
      if el.is_a?(Array)
        flattened += el.my_flatten
      else
        flattened << el
      end
    end
    flattened
  end

  def my_zip(*arr)
    res = []
    (0...self.length).my_each do |idx|
      tmp = [self[idx]]
      arr.my_each()
    end
  end

  def my_rotate(offset = 1)
    offset = (self.length + offset) % self.length if offset < 0
    new_arr = Array.new(self.length)
    new_arr.each_with_index do |_v, idx|
      new_arr[idx] = self[(idx + offset) % self.length]
    end
  end

  def my_join(ch = '')
    res = ''
    i = 0
    while i < self.length
      res += self[i] + ch
      i += 1
    end
    res
  end

  def my_reverse
    res = []
    i = self.length - 1
    while i > -1
      res += [self[i]]
      i -= 1
    end
    res
  end

end

# return_value = [1, 2, 3].my_each do |num|
#   puts num
#  end.my_each do |num|
#   puts num
#  end
#  # => 1
#      2
#      3
#      1
#      2
#      3

#  p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]


# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

p [].my_flatten
p [1].my_flatten
p [1,2].my_flatten
p [1, [2]].my_flatten
p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
