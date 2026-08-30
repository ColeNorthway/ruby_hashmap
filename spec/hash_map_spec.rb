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

    it 'Should find the item if reallocated' do
      map = HashMap.new
      map.set('key', 'value')
      map.set('key1', 'value')
      map.set('key2', 'value')
      map.set('key3', 'value')
      map.set('key4', 'value')
      map.set('key5', 'value')
      map.set('key6', 'value')
      map.set('key7', 'value')
      map.set('key8', 'value')
      map.set('key9', 'value')
      map.set('key10', 'value')
      map.set('key11', 'value')
      map.set('key12', 'value')
      map.set('key13', 'value')
      map.set('key14', 'value')
      map.set('key15', 'value')
      expect(map.get('key15')).to eql('value')
    end
  end

  describe '#length' do
    it 'Should equal 0 if no items exist' do
      hm = HashMap.new
      expect(hm.length).to eql(0)
    end

    it 'Should equal 1 if one item exists' do
      hm = HashMap.new
      hm.set('key', 'value')
      expect(hm.length).to eql(1)
    end

    it 'Should equal 15 if 16 items exist' do
      hm = HashMap.new
      hm.set('key', 'value')
      hm.set('key1', 'value')
      hm.set('key2', 'value')
      hm.set('key3', 'value')
      hm.set('key4', 'value')
      hm.set('key5', 'value')
      hm.set('key6', 'value')
      hm.set('key7', 'value')
      hm.set('key8', 'value')
      hm.set('key9', 'value')
      hm.set('key10', 'value')
      hm.set('key11', 'value')
      hm.set('key12', 'value')
      hm.set('key13', 'value')
      hm.set('key14', 'value')
      hm.set('key15', 'value')
      expect(hm.length).to eql(16)
    end
  end
end











