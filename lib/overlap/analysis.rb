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
      ).overlaps.map do |reference, overlaps|
        Union.new({ reference => overlaps })
      end
      @segments = unions.map { |union| union.segment.to_a }
      @intersections = unions.map { |union| union.intersection_quantity }
      @intersection_quantity = intersections.reduce(:+)
      @quantities_with_intersections = unions.map { |union| union.quantity_with_intersections }
      @quantity_with_intersections = quantities_with_intersections.reduce(:+)
      @quantities = unions.map { |union| union.quantity }
      @quantity = quantities.reduce(:+)
    end
  end
end
