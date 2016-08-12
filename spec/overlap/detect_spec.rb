require 'spec_helper'

module Overlap
  describe Detect do
    let(:collection) do
      Collection.new(
        [
          [20.080, 19.727],
          [19.757, 19.435],
          [19.435, 19.113],
          [19.113, 18.791],
          [18.791, 18.469],
          [18.569, 18.947],
        ]
      ).collection
    end

    subject { described_class.new(collection) }

    it do
      expect(subject.overlaps).to eql([
        { union: Segment.new(18.469, 20.08),
          segments: [
            Segment.new(18.469, 18.791),
            Segment.new(18.569, 18.947),
            Segment.new(18.791, 19.113),
            Segment.new(19.113, 19.435),
            Segment.new(19.435, 19.757),
            Segment.new(19.727, 20.080),
          ]
        }
      ])
    end
  end
end
