require './spec/spec_helper.rb'
require_relative '../lib/enum'

RSpec.describe MyEnumeration do

  # Refer to: all?
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-all-3F
  describe '#all_words_long_than_length?' do
    it 'returns true if all the words in the collection are more than x characters long' do
      my_enum = MyEnumeration.new(%w[coffee tea apple television])
      expect(my_enum.all_words_long_than_length?(1)).to be true
      expect(my_enum.all_words_long_than_length?(2)).to be true
      expect(my_enum.all_words_long_than_length?(3)).to be false
      expect(my_enum.all_words_long_than_length?(4)).to be false
      expect(my_enum.all_words_long_than_length?(6)).to be false
      expect(my_enum.all_words_long_than_length?(7)).to be false
      expect(my_enum.all_words_long_than_length?(8)).to be false
    end
  end

  # Refer to: any?
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-any-3F
  describe '#contains_a_word_longer_than?' do
    it 'returns true if any word is longer than x characters' do
      my_enum = MyEnumeration.new(%w[coffee tea apple television])
      expect(my_enum.contains_a_word_longer_than?(1)).to be true
      expect(my_enum.contains_a_word_longer_than?(2)).to be true
      expect(my_enum.contains_a_word_longer_than?(3)).to be true
      expect(my_enum.contains_a_word_longer_than?(4)).to be true
      expect(my_enum.contains_a_word_longer_than?(6)).to be true
      expect(my_enum.contains_a_word_longer_than?(7)).to be true
      expect(my_enum.contains_a_word_longer_than?(8)).to be true
      expect(my_enum.contains_a_word_longer_than?(9)).to be true
      expect(my_enum.contains_a_word_longer_than?(10)).to be false
    end
  end

  # Refer to: collect / map
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-collect
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-map
  describe '#capitalize_words' do
    it 'capitalizes all words in the collection' do
      my_enum = MyEnumeration.new(%w[coffee tea apple television])
      expect(my_enum.capitalize_words).to eq %w[Coffee Tea Apple Television]
    end
  end

  describe '#square_numbers' do
    it 'squares all the numbers in the collection' do
      my_enum = MyEnumeration.new([2, 4, 6, 8])
      expect(my_enum.square_numbers).to eq [4, 16, 36, 64]
    end
  end

  describe '#reverse_words' do
    it 'reverses all words in the collection' do
      my_enum = MyEnumeration.new(%w[coffee tea apple television])
      expect(my_enum.reverse_words).to eq ["eeffoc", "aet", "elppa", "noisivelet"]
    end
  end

  # Refer to collect_concat or flat_map
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-flat_map
  describe '#positive_and_negative_numbers' do
    it 'returns all numbers as both positive and negative ' do
      my_enum = MyEnumeration.new([2, 4, 10, -22])
      expect(my_enum.positive_and_negative_numbers).to eq [2, -2, 4, -4, 10, -10, 22, -22]
    end
  end

  # Refer to count
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-count
  describe '#number_elements_in_collection' do
    it 'returns the number of elements in a collection' do
      my_enum = MyEnumeration.new([2, 4, 10, -22])
      expect(my_enum.number_elements_in_collection).to eq 4
    end
  end

  describe '#instances_of_numerics' do
    it 'returns the number of elements that are Float or Fixnums' do
      my_enum = MyEnumeration.new([1, 2, 'Buckle my shoe', 3, 4, 'Close the door', true, 5, 6, 'pickup sticks', 3.14])
      expect(my_enum.instances_of_numerics).to eq 7
    end
  end

  # Refer to detect or find
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-detect
  describe '#find_first_awesome_person' do
    it 'returns the first person who is awesome' do
      my_enum = MyEnumeration.new([{name: "JohnDoe", awesome: false}, {name: "Chris", awesome: true}, {name: "Anna", awesome: true}])
      expect(my_enum.find_first_awesome_person[:name]).to eq "Chris"
    end
  end
end