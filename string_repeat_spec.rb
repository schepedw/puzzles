require 'rspec'
require './string_repeat'

describe StringRepeat do
  before do
    @t1 = Time.now
  end

  after do
    @t2 = Time.now
    elapsed_time = @t2 - @t1
    puts "Time elapsed: #{ '%.04f' % (elapsed_time * 1000)} ms"
  end

  describe '#first_unique_char' do
    context 'error values' do
      [nil, '', 3].each do |input|
        it "returns '' for #{input}" do
          expect(StringRepeat.first_unique_char(input)).to eql ''
        end
      end
    end

    context 'long use cases' do
      [10, 100, 1000, 10000, 100000,  1000000].each do |num|
        it "finds the correct answer for input size #{num}" do
          expect(StringRepeat.first_unique_char('g' + ('o' * num) + 'gle')).to eql 'l'
        end
      end
    end
  end
  describe '#first_unique_char' do
    context 'error values' do
      [nil, '', 3].each do |input|
        it "returns '' for #{input}" do
          expect(StringRepeat.first_unique_char(input)).to eql ''
        end
      end
    end

    context 'long use cases' do
      context 'not unique input' do
        [10, 100, 1000, 10000, 100000,  1000000].each do |num|
          it "finds the correct answer for input size #{num}" do
            expect(StringRepeat.all_unique_elements?('g' + ('o' * num) + 'gle')).to be false
          end
        end
      end

      context 'unique input' do
        let(:all_chars) { (0..255).inject(""){|str, i| str + i.chr } }
        [5, 10, 25, 50, 100, 200].each do |num|
          it "finds the correct answer for input size #{num}" do
            expect(StringRepeat.all_unique_elements?(all_chars[0..num])).to be true
          end
        end
      end
    end
  end
end
