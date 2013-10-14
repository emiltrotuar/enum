class MyEnumerator
	def initialize array
		raise 'input should be array' unless array.is_a? Array
		raise 'array must contain at least 1 element' if array.count<1
		@array,@amt = array,array.count
		@i = 0
	end

	def first
		@array.first
	end

	def peek
		@array[@i]
	end

	def next
		@tmp = @i
		@i += 1
		if @i > @amt
			@i = @tmp
			raise StopIteration
		else
			@array[@tmp]
		end
	end

	def rewind
		@i = 0
		self
	end

	def inspect
		p '#<MyEnumerator: ...>'
	end
end