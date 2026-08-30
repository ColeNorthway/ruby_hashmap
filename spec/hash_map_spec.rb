# frozen_string_literal: true

# frozen_string_literal: true

require_relative '../lib/hash_map//hash_map'

RSpec.describe LinkedList do
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
end











