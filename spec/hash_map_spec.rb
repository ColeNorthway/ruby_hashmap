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

  describe '#has?' do
    it 'Should be false for empty hashmap' do
      hm = HashMap.new
      expect(hm.has?('key')).to eql(false)
    end

    it 'Should be true for hashmap of length 1' do
      hm = HashMap.new
      hm.set('key', 'value')
      expect(hm.has?('key')).to eql(true)
    end

    it 'Should be false for hashmap of length 1 on wrong value' do
      hm = HashMap.new
      hm.set('key', 'value')
      expect(hm.has?('sdfi;asdfo')).to eql(false)
    end

    it 'Should be true for hashmap of length 3' do
      hm = HashMap.new
      hm.set('key', 'value')
      hm.set('key1', 'value')
      hm.set('key2', 'value')
      expect(hm.has?('key2')).to eql(true)
    end

    it 'Should be false for hashmap of length 3 on wrong value' do
      hm = HashMap.new
      hm.set('key', 'value')
      hm.set('key1', 'value')
      hm.set('key2', 'value')
      expect(hm.has?('iiiiiiiiii')).to eql(false)
    end

    it 'Should be true for hashmap of length 16' do
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
      expect(hm.has?('key15')).to eql(true)
    end

    it 'Should be false for hashmap of length 16 on wrong value' do
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
      expect(hm.has?('   ')).to eql(false)
    end
  end

  describe '#remove' do
    it 'Should be nil if HashMap is empty' do
      hm = HashMap.new
      expect(hm.remove('key')).to eql(nil)
    end

    it 'Should be the value if HashMap length is 1' do
      hm = HashMap.new
      hm.set('key', 'value')
      expect(hm.remove('key')).to eql('value')
    end

    it 'Should be nil if HashMap length is 1 and arg is not present' do
      hm = HashMap.new
      hm.set('key', 'value')
      expect(hm.remove(' ')).to eql(nil)
    end

    it 'Length should be 0 after removing with prev length 1' do
      hm = HashMap.new
      hm.set('key', 'value')
      hm.remove('key')
      expect(hm.length).to eql(0)
    end

    it 'Should be the value if HashMap length is 3 and arg is present' do
      hm = HashMap.new
      hm.set('key', 'value')
      hm.set('key1', 'value')
      hm.set('key2', 'value')
      expect(hm.remove('key2')).to eql('value')
    end

    it 'Should be nil if HashMap length is 3 and arg is not present' do
      hm = HashMap.new
      hm.set('key', 'value')
      hm.set('key1', 'value')
      hm.set('key2', 'value')
      expect(hm.remove('ky2')).to eql(nil)
    end

    it 'Length should be 2 after removing with prev length 3' do
      hm = HashMap.new
      hm.set('key', 'value')
      hm.set('key1', 'value')
      hm.set('key2', 'value')
      hm.remove('key2')
      expect(hm.length).to eql(2)
    end

    it 'Should be the value if HashMap length is 16 and arg is present' do
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
      expect(hm.remove('key15')).to eql('value')
    end

    it 'Should be nil if HashMap length is 16 and arg is not present' do
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
      expect(hm.remove('key150')).to eql(nil)
    end

    it 'Length should be 15 after removing with prev length 16' do
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
      hm.remove('key15')
      expect(hm.length).to eql(15)
    end
  end

  describe '#clear' do
    it 'Should have length zero after clear on previous length zero' do
      hm = HashMap.new
      hm.clear
      expect(hm.length).to eql(0)
    end

    it 'Should have length zero after clear on previous length three' do
      hm = HashMap.new
      hm.set('key', 'value')
      hm.set('key1', 'value')
      hm.set('key2', 'value')
      hm.clear
      expect(hm.length).to eql(0)
    end

    it 'Should have length zero after clear on previous length sixteen' do
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
      hm.clear
      expect(hm.length).to eql(0)
    end
  end

  describe '#keys' do
    it 'Should be [] for empty HashMap' do
      hm = HashMap.new
      expect(hm.keys).to eql([])
    end

    it 'Should be accurate for HashMap of length 1' do
      hm = HashMap.new
      hm.set('key', 'value')
      expect(hm.keys).to eql(['key'])
    end

    it 'Should be accurate for HashMap of length 3' do
      hm = HashMap.new
      hm.set('key', 'value')
      hm.set('key1', 'value')
      hm.set('key2', 'value')
      expect(hm.keys.length).to eql(3)
    end

    it 'Should be accurate for HashMap of length 16' do
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
      expect(hm.keys.length).to eql(16)
    end
  end


  describe '#values' do
    it 'Should be [] for empty HashMap' do
      hm = HashMap.new
      expect(hm.values).to eql([])
    end

    it 'Should be accurate for HashMap of length 1' do
      hm = HashMap.new
      hm.set('key', 'value')
      expect(hm.values).to eql(['value'])
    end

    it 'Should be accurate for HashMap of length 3' do
      hm = HashMap.new
      hm.set('key', 'value')
      hm.set('key1', 'value')
      hm.set('key2', 'value')
      expect(hm.values.length).to eql(3)
    end

    it 'Should be accurate for HashMap of length 16' do
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
      expect(hm.values.length).to eql(16)
    end
  end

  describe '#entries' do
    it 'Should be [] for empty HashMap' do
      hm = HashMap.new
      expect(hm.entries).to eql([])
    end

    it 'Should be accurate for HashMap of length 1' do
      hm = HashMap.new
      hm.set('key', 'value')
      expect(hm.entries).to eql([{ 'key' => 'value' }])
    end

    it 'Should be accurate for HashMap of length 3' do
      hm = HashMap.new
      hm.set('key', 'value')
      hm.set('key1', 'value')
      hm.set('key2', 'value')
      expect(hm.entries.length).to eql(3)
    end

    it 'Should be accurate for HashMap of length 16' do
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
      expect(hm.entries.length).to eql(16)
    end
  end
end











