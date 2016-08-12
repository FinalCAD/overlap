require 'spec_helper'

module Overlap
  describe Segment do

    subject { described_class.new(2.0, 5.0) }

    it do
      expect(subject.center).to eql(3.5)
      expect(subject.radius).to eql(1.5)
      expect(subject.quantity).to eql(3.0)
      expect(subject.key).to eql([2.0, 5.0])
    end

    it 'for same values object should be equal' do
      expect(Segment.new(2,3)).to eql(Segment.new(2,3))
    end

    it 'give shared distance' do
      expect(Segment.new(1,4).intersection(Segment.new(3.5,6))).to eql(0.5)
    end

    describe '#overlap?' do
      context 'overlapped' do
        it 'should return true' do
          expect(Segment.new(1,4.8).overlap?(Segment.new(3.5,6))).to eql(true)
        end
      end
      context 'discontinuous' do
        it 'should return false' do
          expect(Segment.new(1,4.8).overlap?(Segment.new(5,6))).to eql(false)
        end
      end
      context 'contiguous' do
        it 'should return true' do
          expect(Segment.new(1,4.8).overlap?(Segment.new(4.8,6))).to eql(true)
        end
      end
    end

    describe '#update!' do
      let(:first_segment)  { Segment.new(1,4.8) }
      let(:second_segment) { Segment.new(3,6) }
      it 'should merge one to another' do
        expect {
          first_segment.merge!(second_segment)
        }.to change {
          first_segment.end_position
        }.from(4.8).to(6)
      end
      it 'should merge one to another' do
        expect {
          second_segment.merge!(first_segment)
        }.to change {
          second_segment.start_position
        }.from(3).to(1) 
      end
    end
  end
end
