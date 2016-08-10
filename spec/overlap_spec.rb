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
      expect(subject.map { |u| u.segment.to_a }).to eql([[1.0, 2.5], [3.0, 5.0], [6.5, 8.0]])
      expect(subject.map { |u| u.intersection_quantity }).to eql([1.0, 1.0, 0.2])
      expect(subject.map { |u| u.quantity_with_intersections }.reduce(:+)).to eql(7.2)
      expect(subject.map { |u| u.quantity_with_intersections }).to eql([2.5, 3.0, 1.7])
      expect(subject.map { |u| u.quantity }.reduce(:+)).to eql(5.0)
      expect(subject.map { |u| u.quantity }).to eql([1.5, 2.0, 1.5])
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
      expect(subject.map { |u| u.segment.to_a }).to eql([[0.5, 5.0], [6.5, 8.0]])
      expect(subject.map { |u| u.intersection_quantity }).to eql([5.5, 0.2])
      expect(subject.map { |u| u.quantity_with_intersections }.reduce(:+)).to eql(11.7)
      expect(subject.map { |u| u.quantity_with_intersections }).to eql([10.0, 1.7])
      expect(subject.map { |u| u.quantity }.reduce(:+)).to eql(6.0)
      expect(subject.map { |u| u.quantity }).to eql([4.5, 1.5])
    end
  end
end
