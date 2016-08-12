require 'spec_helper'

module Overlap
  describe Union do
    let(:overlap) do
      { union: Segment.new(1, 6),
        segments: [
          Segment.new(2, 4),
          Segment.new(2, 3),
          Segment.new(1, 4),
          Segment.new(3, 4),
          Segment.new(4, 6),
        ]
      }
    end

    subject { described_class.new(overlap) }

    it do
      expect(subject.segment).to eql(Segment.new(1, 6))
      expect(subject.quantity).to eql(5)
      expect(subject.intersections).to eql([2, 1, 1, 0])
      expect(subject.quantity_with_intersections).to eql(9.0)
      expect(subject.segments).to eql([
        Segment.new(1.0, 4.0),
        Segment.new(2.0, 3.0),
        Segment.new(2.0, 4.0),
        Segment.new(3.0, 4.0),
        Segment.new(4.0, 6.0)
      ])
    end
  end
end
