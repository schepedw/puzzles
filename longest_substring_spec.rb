require 'rspec'
require './longest_substring'

describe LongestSubstring do
  before do
    @t1 = Time.now
  end

  after do
    @t2 = Time.now
    elapsed_time = @t2 - @t1
    puts "Time elapsed: #{ '%.04f' % (elapsed_time * 1000)} ms"
  end

  context 'returns entire string if >= 2 distinct characters' do
    specify 'when given empty string' do
      expect(LongestSubstring.search('')).to eql ''
    end

    specify 'when given a 1 character string' do
      expect(LongestSubstring.search('a')).to eql 'a'
    end

    specify 'when given nil' do
      expect(LongestSubstring.search(nil)).to eql '' #could throw error here, really just depends on reqs
    end

    specify 'when given non-string' do
      expect(LongestSubstring.search(3)).to eql '' #could throw error here, really just depends on reqs
    end

    specify '1 distinct character' do
      expect(LongestSubstring.search('aaaaa')).to eql 'aaaaa'
    end

    specify '2 distinct characters' do
      expect(LongestSubstring.search('abababaa')).to eql 'abababaa'
    end
  end

  context 'easy use cases' do
    { 'abc' => 'ab',
      'abbc' => 'abb',
      'aabbcc' => 'aabb',
      'abcc' => 'bcc'
    }.each do |key, value|
      specify "the longest substring for #{key} is #{value}" do
        expect(LongestSubstring.search(key)).to eql value
      end
    end
  end

  context 'medium use cases' do
    [10, 100].each do |num|
      { 'a' * num + 'bc' => 'a' * num + 'b',
        'ab' * num + 'cd' => 'ab' * num,
        'a' * num + 'b' * (num + 1) + 'c' * num => 'a' * num + 'b' * (num + 1),
      }.each do |key, value|
        it "finds the right answer for #{num} letters" do
          expect(LongestSubstring.search(key)).to eql value
        end
      end
    end
  end
  context 'large use cases' do
    [10, 100, 1000, 10000, 100000].each do |num|
      { 'a' * num + 'b' * (num + 1) + 'c' * num => 'a' * num + 'b' * (num + 1) }.each do |key, value|
        it "finds the right answer for #{num} letters" do
          expect(LongestSubstring.search(key)).to eql value
        end
      end
    end
  end
end
