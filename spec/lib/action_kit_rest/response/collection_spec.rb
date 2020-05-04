require 'spec_helper'

describe ActionKitRest::Response::Collection  do
  let(:meta) { double() }
  let(:objects) { double() }
  subject { ActionKitRest::Response::Collection.new(meta, objects) }

  describe 'initialization' do
    it 'should set meta and objects' do
      expect(subject.meta).to eq(meta)
      expect(subject.objects).to eq(objects)
    end
  end

  describe 'each' do
    let(:item1) { double }
    let(:item2) { double }
    let(:objects) { [ item1, item2 ] }

    it "should return all collection items" do
      expect(subject.count).to eq(2)
      subject.any? { |i| i == item1 }
      subject.any? { |i| i == item2 }
    end
  end
end
