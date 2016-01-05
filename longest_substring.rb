#Given a string, find the longest substring that contains at most 2 distinct characters.
require 'active_support'
require 'pry'
class LongestSubstring

  def self.search(input, max = 2)
    return '' if !input.is_a?(String)
    @max = max
    @unique_chars = {}
    @max_substring = [0,0]
    a = input.split(//)
    a.each_with_index do |char, index|
      notice_or_update(char, index)
      index = adjust_to_remove_char || index
      find_new_max_substring
    end
    input[@max_substring[0]..@max_substring[1]]
  end

  private

  def self.find_new_max_substring
    beginning = @unique_chars.values.map{ |a| a[:first_seen]}.min
    ending = @unique_chars.values.map{ |a| a[:last_seen]}.max
    current_max = @max_substring[1] - @max_substring[0]
    if (ending - beginning) > current_max
      @max_substring = [beginning, ending]
    end
  end

  def self.notice_or_update(char, position)
    if @unique_chars.keys.include?(char)
      @unique_chars[char][:last_seen] = position
    else
      @unique_chars[char] = {first_seen: position, last_seen: position}
    end
  end

  def self.substring_length
    beginning = @unique_chars.values.map{ |a| a[:first_seen]}.min
    ending = @unique_chars.values.map{ |a| a[:last_seen]}.max
    ending - beginning
  end

  def self.adjust_to_remove_char
    return if @unique_chars.keys.count <= @max
    oldest = @unique_chars.values.map{ |a| a[:first_seen]}.min
    key_to_delete, _ = @unique_chars.find{|_, v| v[:first_seen] == oldest}
    @unique_chars.delete(key_to_delete)[:last_seen] + 1
  end
end
