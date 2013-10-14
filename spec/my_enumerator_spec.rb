require 'spec_helper'
require './my_enumerator'

describe MyEnumerator do
	before do
		@a = MyEnumerator.new [1,2,3,4,5]
end

	it 'should perform peek method' do
		@a.peek.shoud eq 1
	end

	it 'should perform first method' do
		@a.first.shoud eq 1
	end

	it 'should perform next method' do
		@a.next.shoud eq 1
		@a.next.shoud eq 2
		@a.next.shoud eq 3
		@a.next.shoud eq 4
	end

	it 'should perform rewind method' do
		@a.next.shoud eq 5
		@a.rewind.shoud eq 1
	end
end