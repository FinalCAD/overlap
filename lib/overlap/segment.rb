module Overlap
  class Segment

    attr_reader :center, :radius, :start_position, :end_position, :quantity, :key

    def initialize(start_position, end_position)
      @start_position = start_position
      @end_position   = end_position
      build!
    end

    def merge!(other)
      if other.start_position < start_position
        @start_position = other.start_position
      end

      if end_position < other.end_position
        @end_position = other.end_position
      end

      build!
    end

    def to_s
      "[#{start_position.to_f}, #{end_position.to_f}]"
    end
    alias_method :inspect, :to_s

    def inspect
      "#{self.class.name}##{self.object_id} #{to_s}"
    end

    def to_a
      [ start_position, end_position ]
    end

    def same?(other)
      self == other
    end

    def overlap?(other)
      (center - other.center).abs.round(3) <= (radius + other.radius).round(3)
    end

    def ==(other)
      self.class == other.class && to_a == other.to_a
    end
    alias :eql? :==

    def hash
      to_a.hash
    end

    def intersection(other)
      end_position - other.start_position
    end

    def <=>(other)
      if start_position == other.start_position
        end_position <=> other.end_position
      else
        start_position <=> other.start_position
      end
    end

    private

    def build!
      @quantity = end_position - start_position
      @radius   = quantity / 2
      @center   = start_position + radius
      @key      = [ start_position, end_position ]
    end
  end
end
