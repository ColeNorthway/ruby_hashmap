# frozen_string_literal: true

# frozen_string_literal: true

require_relative '../lib/hash_map/hash_map'

RSpec.describe HashMap do
  describe '#set' do
    it 'Should have the value inserted after setting' do
      map = HashMap.new
      map.set('key', 'value')
      expect(map.get('key')).to eql('value')
    end

    it 'Should have the new value after setting and overriding' do
      map = HashMap.new
      map.set('key', 'value')
      map.set('key', 'something')
      expect(map.get('key')).to eql('something')
    end
  end

  describe '#get' do
    it 'Should be null if value not found with items' do
      map = HashMap.new
      map.set('key', 'value')
      map.set('key1', 'value2')
      expect(map.get('key2')).to eql(nil)
    end

    it 'Should be be null if value not found with no items' do
      map = HashMap.new
      expect(map.get('key')).to eql(nil)
    end

    it 'Should find the item if many items' do
      map = HashMap.new
      map.set('key', 'value')
      map.set('key1', 'value2')
      expect(map.get('key')).to eql('value')
    end
  end

end











