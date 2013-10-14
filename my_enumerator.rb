module M
	def each
		super
	end
end

class MyEnumerator
	attr_reader :i
	
	def initialize array
		@array = array if array.is_a? Array
		@i = 0
	end

	def first
		@array.first
	end

	def peek
		@array
	end

	def next
		@array[@i]
		@i+=1
	end

	def rewind
		i = 0
		@array[i]
	end
end
