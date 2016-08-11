module Overlap
  class Union

    attr_reader :segment, :quantity, :intersections, :quantity_with_intersections, :intersection_quantity, :segments

    def initialize(data_overlaps)
      @segments = data_overlaps.flatten.flatten.sort
      build!
    end

    private

    def build!
      start_position = flatten_values.min
      end_position   = flatten_values.max

      @segment = Segment.new(start_position, end_position)
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

      @intersection_quantity = intersections.reduce(:+)&.round(2) || 0
      @quantity_with_intersections = quantity + intersection_quantity
    end

    def flatten_values
      @flatten_values ||= segments.map(&:to_a).flatten
    end
  end
end
