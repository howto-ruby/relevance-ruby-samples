# codecite NORMALIZER
module Palindrome
  NORMALIZER = Proc.new do |x|
    x.to_s.gsub(/[^\d\w]/,'').downcase
  end
end
# codecite NORMALIZER

# codecite Extensions
module Palindrome::Extensions
  def palindrome?(&blk)
    blk = Palindrome::NORMALIZER unless block_given?
    normalized = blk.call(self)
    normalized == normalized.reverse
  end
end
# codecite Extensions
 
# codecite include
class String
  include Palindrome::Extensions
end
class Integer
  include Palindrome::Extensions
end
# codecite include
