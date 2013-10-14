module MyEnumerable
	def map
		a = []
		each { |i| a << yield(i) }
		a
	end

	def select
		# block_given? ? return select {|i| self.send i}
		a = []
		each { |i| a << i if yield(i) }
		a
	end

	def inject input=nil
		return reduce {|sum,a| sum.send input, a} if input.is_a? Symbol 
		sum = input
		each { |i| sum = sum.nil? ? i : yield(sum, i) }
		sum
	end
end