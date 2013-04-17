require 'spec_helper'

module Dotify
  describe Symlink do
    subject { pointer }
    describe "default behavior" do
      let(:source) { "#{Dir.home}/.dotify/.file" }
      let(:destination) { "#{Dir.home}}/.file" }
      let(:pointer) { Symlink.new(source, destination) }
      its(:source) { should == source }
      its(:destination) { should == destination }
    end

    describe "#eql?" do
      subject(:pointer) { Symlink.new("example", "destination") }
      context "when they are equal" do
        let(:other) { Symlink.new("example", "destination") }
        it { pointer.eql?(other).should be_true }
      end
      context "when they have same source but different destination" do
        let(:other) { Symlink.new("example", "other-destination")}
        it { pointer.eql?(other).should be_true }
      end
      context "when they are not equal" do
        let(:other) { Symlink.new("examples", "destination") }
        it { pointer.eql?(other).should be_false }
      end
    end
  end
end