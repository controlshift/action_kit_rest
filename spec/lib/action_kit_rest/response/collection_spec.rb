require 'spec_helper'

describe ActionKitRest::Response::Collection  do
  let(:meta) { double() }
  let(:objects) { double() }
  subject { ActionKitRest::Response::Collection.new(meta, objects) }

  describe 'initialization' do
    it 'should set meta and objects' do
      subject.meta.should == meta
      subject.objects.should == objects
    end
  end

  describe 'each' do
    let(:item1) { double }
    let(:item2) { double }
    let(:objects) { [ item1, item2 ] }

    it "should return all collection items" do
      subject.count.should == 2
      subject.any? { |i| i == item1 }
      subject.any? { |i| i == item2 }
    end
  end
end