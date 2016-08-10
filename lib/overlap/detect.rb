module Overlap
  class Detect

    attr_reader :overlaps

    def initialize(collection)
      @collection = collection
      @overlaps = {}
      build!
    end

    private

    def build!
      destructive_collection = @collection.dup.to_a

      while (one = destructive_collection.shift) do
        @collection.delete(one)
        _overlaps = @collection.map do |other|
          next if one.same?(other)
          other if one.overlap?(other)
        end.compact
        _overlaps.each { |e| @collection.delete(e) }
        _overlaps.each { |e| destructive_collection.delete(e) }
        @overlaps[one] = _overlaps
      end
    end
  end
end
