module Overlap
  class Union

    attr_reader :segment, :quantity, :intersections, :quantity_with_intersections, :intersection_quantity, :segments

    def initialize(overlapped_segments)
      @overlapped_segments = overlapped_segments
      @segments = overlapped_segments[:segments].sort
      build!
    end

    private

    def build!
      @segment = @overlapped_segments[:union]
      @quantity = segment.quantity

      previous_value = nil
      @intersections = segments.sort.map do |_segment|
        intersection = nil
        if previous_value
          intersection = previous_value - _segment.start_position
        end
        previous_value = _segment.end_position
        intersection
      end.compact

      @intersection_quantity = intersections.reduce(:+)&.round(3) || 0
      @quantity_with_intersections = segments.map(&:quantity).reduce(:+)&.round(3) || 0
    end
  end
end
