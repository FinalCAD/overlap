module Overlap
  class Detect

    attr_reader :overlaps

    def initialize(collection)
      @collection = collection
      @overlaps = []
      build!
    end

    private

    def build!
      destructive_collection = @collection.dup.to_a
      current_segment = nil

      while (one = destructive_collection.shift) do
        current_segment = Segment.new(one.start_position, one.end_position)
        segments = []
        segments << one

        @collection.map do |other|
          next if current_segment.same?(other)
          if current_segment.overlap?(other)
            current_segment.merge!(other)
            segments << other
          end
        end.compact

        segments.each { |e| @collection.delete(e) }
        segments.each { |e| destructive_collection.delete(e) }

        @overlaps << { union: current_segment, segments: segments }
      end
    end
  end
end
