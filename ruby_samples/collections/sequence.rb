# codecite class
class Sequence
  include Enumerable
end
# codecite class

class Sequence
  # codecite initialize
  def initialize(size, *init, &blk)
    raise ArgumentError, "block must be supplied" unless block_given?
    @size = size
    @so_far = init
    @block = blk
  end
  # codecite initialize
  
  # codecite get_element
  def [](idx)
    return nil if idx >= @size
    while idx >= @so_far.size
      generate_next
    end
    @so_far[idx]
  end
  # codecite get_element
  
  # codecite generate_next
  def generate_next
    @so_far << @block.call(@so_far)
  end
  # codecite generate_next
  
  # codecite each
  def each
    @size.times do |i|
      yield self[i]
    end
  end
  # codecite each
end
