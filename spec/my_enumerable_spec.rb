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
		@a.inject(&:+).should eq 15
		@a.inject {|sum, i| sum + i}.should eq 15
	end
end