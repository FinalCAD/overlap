require 'spec_helper'

describe Overlap do
  subject { described_class.find(data) }
  context 'first set of data' do
    let(:data) do
      [
        [4.0, 5.0],
        [1.0, 2.0],
        [7.3, 8.0],
        [2.5, 1.5],
        [6.5, 7.5],
        [2.0, 2.5],
        [5.0, 3.0],
      ]
    end
    it do
      expect(subject.segments).to eql([[1.0, 2.5], [3.0, 5.0], [6.5, 8.0]])
      expect(subject.intersections).to eql([1.0, 1.0, 0.2])
      expect(subject.intersection_quantity).to eql(2.2)
      expect(subject.quantity_with_intersections).to eql(7.2)
      expect(subject.quantities_with_intersections).to eql([2.5, 3.0, 1.7])
      expect(subject.quantity).to eql(5.0)
      expect(subject.quantities).to eql([1.5, 2.0, 1.5])
    end
  end
  context 'second set of data' do
    let(:data) do
      [
        [0.5, 5.0],
        [2.0, 1.0],
        [4.0, 5.0],
        [1.5, 2.5],
        [3.0, 5.0],
        [8.0, 7.3],
        [6.5, 7.5],
        [2.0, 2.5],
      ]
    end
    it do
      expect(subject.segments).to eql([[0.5, 5.0], [6.5, 8.0]])
      expect(subject.intersections).to eql([5.5, 0.2])
      expect(subject.intersection_quantity).to eql(5.7)
      expect(subject.quantity_with_intersections).to eql(11.7)
      expect(subject.quantities_with_intersections).to eql([10.0, 1.7])
      expect(subject.quantity).to eql(6.0)
      expect(subject.quantities).to eql([4.5, 1.5])
    end
  end
  context 'without data' do
    let(:data) { [] }
    it { expect(described_class.find(data).quantity).to eql(0) }
  end
  context 'third set of data', focus: true do
    let(:data) do
      [
        [20.080, 19.727],
        [19.757, 19.435],
        [19.435, 19.113],
        [19.113, 18.791],
        [18.791, 18.469],
        [18.569, 18.947],
      ]
    end
    it do
      expect(subject.segments).to eql([[18.469, 20.08]])
      expect(subject.intersections).to eql([0.408])
      expect(subject.intersection_quantity).to eql(0.408)
      expect(subject.quantity_with_intersections).to eql(2.019)
      expect(subject.quantities_with_intersections).to eql([2.019])
      expect(subject.quantity).to eql(1.611)
      expect(subject.quantities).to eql([1.611])
    end
  end
end
