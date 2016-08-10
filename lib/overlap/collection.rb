module Overlap
  class Collection

    attr_reader :collection

    def initialize(input_collection, options={})
      @input_collection = input_collection
      @options = options
      build!
    end

    def to_a
      collection.map { |e| e.to_a }
    end

    private

    def build!
      _collection = @input_collection.map do |entry|
        _start = entry.send(@options.fetch(:start, :first))
        _end   = entry.send(@options.fetch(:end, :last))
        [ _start, _end ].sort if _start && _end
      end.compact.sort { |x,y| x[0] <=> y[0] }
      @collection = _collection.map { |x, y| Segment.new(x, y) }
    end
  end
end
