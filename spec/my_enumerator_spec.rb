require 'spec_helper'
require './my_enumerator'

class TestArray < Array
	def initialize *args
		@a = []
		args.each do |i|
			@a << i
		end
	end

	def each &block
    if block_given?
      @a.each &block
    else
      MyEnumerator.new @a
    end
  end
end

describe MyEnumerator do
	before do
		@enum = TestArray.new(1,2,3,4,5).each
	end

	it 'should raise error in case of wrong input' do
		expect do 
			MyEnumerator.new 0
		end.to raise_error RuntimeError
		expect do 
			MyEnumerator.new []
		end.to raise_error RuntimeError
	end

	it 'should perform first method' do
		@enum.first.should eq 1
	end

	it 'should perform next method' do
		@enum.first
		@enum.next.should eq 1
		@enum.next.should eq 2
		@enum.next.should eq 3
		@enum.next.should eq 4
	end

	it 'should perform peek method' do
		@enum.peek.should eq 1
		@enum.next.should eq 1
		@enum.peek.should eq 2
	end

	it 'should raise stop iteration' do
		5.times { @enum.next }
		expect { @enum.next }.to raise_error StopIteration
	end

	it 'should perform rewind method' do
		5.times { @enum.next }
		@enum.rewind.next.should eq 1
	end
end