require 'spec_helper'
require './my_enumerable'

describe MyEnumerable do
	before do
		@a = [1,2,3,4,5]
		@a.singleton_class.send(:include, MyEnumerable)
	end

	it 'should map the values' do
		@a.map {|i| i+1}.should eq [2,3,4,5,6]
	end

	it 'should select the values' do
		@a.select {|i| i.even?}.should eq [2,4]
	end

	it 'should inject the values' do
		@a.inject {|sum, i| sum + i}.should eq 15
		@a.inject(5) {|sum, i| sum + i}.should eq 20
		@a.inject(&:+).should eq 15
		@a.inject(5,:+).should eq 20
	end

	it 'should raise error in case of wrong input' do
		expect do 
			@a.inject(5,10,:+)
		end.to raise_error RuntimeError
	end
end