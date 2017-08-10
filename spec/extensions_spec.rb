require 'spec_helper'

describe Array do
  context '#all_empty?' do
    it 'returns true if all elements of an array are empty' do
      expect(['', '', ''].all_empty?).to be true
    end

    it 'returns false if some of the Array elements are not empty' do
      expect(['', '', 'something'].all_empty?).to be false
    end

    it 'returns true for an empty Array' do
      expect([].all_empty?).to be true
    end
  end

  context '#all_same?' do
    it 'returns true if all elements of an array are the same' do
      expect(['A', 'A', 'A'].all_same?).to be true
    end

    it 'returns false if all of the elmenets are not the same' do
      expect(['A', 'B', 'A'].all_same?).to be false
    end

    it 'returns true if the array is empty' do
      expect([].all_same?).to be true
    end
  end

  context '#any_empty?' do
    it 'returns true if any element is empty' do
      expect(['A', '', ''].any_empty?).to be true
    end

    it 'returns false if no elements are empty' do
      expect(['A', 'B', 'C'].any_empty?).to be false
    end

    it 'returns false if the array is truely empty' do
      expect([].any_empty?).to be false
    end
  end

  context '#none_empty' do
    it 'returns true if if the array has no empty values' do
      expect(['A', 'A', 'B'].none_empty?).to be true
    end

    it 'returns false if there is at least one empty element' do
      expect(['A', '', 'B'].none_empty?).to be false
    end

    it 'returns true if the array is an empty collect' do
      expect([].none_empty?).to be true
    end
  end
end
