require 'active_support'
class StringRepeat

  def self.first_unique_char(input)
    #function to find the first character in a String that doesn't repeat.  For example, inputting "google" should return 'l'.
    return '' if !input.kind_of?(String) || input.empty?
    a = input.split(//)
    counts = a.each_with_object( {} ) do |char, h|
      h[char] = h[char] ? (h[char] + 1) : 1
    end
    a.find{|char| counts[char] == 1}
  end

  def self.all_unique_elements?(input)
    # function to determine whtether all the elements in the given input are unique
    # You can probably solve this the same way you solved the one above
    # But that's lame.
  end
end
