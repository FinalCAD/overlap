require 'spec_helper'

module Overlap
  describe Collection do
    let(:source_collection) do
      [
        [4.0, 5.0],
        [1.0, 2.0],
        [7.3, 8.0],
        [2.5, 1.5],
        [6.5, 7.5],
        [5.0, 0.5],
        [2.0, 2.5],
        [5.0, 3.0],
      ]
    end
    let(:collection) do
      [
        [0.5, 5.0],
        [1.0, 2.0],
        [1.5, 2.5],
        [2.0, 2.5],
        [3.0, 5.0],
        [4.0, 5.0],
        [6.5, 7.5],
        [7.3, 8.0]
      ]
    end

    subject { described_class.new(source_collection) }

    it { expect(subject.collection.map(&:to_a)).to eql(collection) }
  end
end
