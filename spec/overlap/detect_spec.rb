require 'spec_helper'

module Overlap
  describe Detect do
    let(:collection) do
      Collection.new(
        [
          [1.0, 2.0],
          [1.5, 2.5],
          [2.0, 2.5],

          [5.0, 6.0],
        ]
      ).collection
    end
    subject { described_class.new(collection) }
    it do
      expect(subject.overlaps).to eql({
        Segment.new(1.0, 2.0) => [ Segment.new(1.5, 2.5), Segment.new(2.0, 2.5) ],
        Segment.new(5.0, 6.0) => [ ] 
      })
    end
  end
end
