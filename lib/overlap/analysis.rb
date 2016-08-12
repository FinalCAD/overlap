module Overlap
  class Analysis

    attr_reader :unions, :segments, :intersections, :quantity_with_intersections, :quantities_with_intersections,
      :intersection_quantity, :quantities, :quantity

    def initialize(input_data, options={})
      @input_data = input_data
      @options = options
      build!
    end

    private

    def build!
      @unions = Detect.new(
        Collection.new(@input_data, @options).collection
      ).overlaps.map do |overlapped_segments|
        Union.new(overlapped_segments)
      end
      @segments = unions.map { |union| union.segment.to_a }
      @intersections = unions.map { |union| union.intersection_quantity }
      @intersection_quantity = intersections.reduce(:+)
      @quantities_with_intersections = unions.map { |union| union.quantity_with_intersections }
      @quantity_with_intersections = quantities_with_intersections.reduce(:+)
      @quantities = unions.map { |union| (union.quantity&.round(3) || 0) }
      @quantity = quantities.reduce(:+)&.round(3) || 0
    end
  end
end
