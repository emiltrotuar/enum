module MyEnumerable
	def map
		a = []
		each { |i| a << yield(i) }
		a
	end

	def select
		a = []
		each { |i| a << i if yield(i) }
		a
	end

	def inject *input
		raise 'too many argument passed' if input.count > 2
		if input.count == 1 and input.is_a? Symbol
			reduce {|sum,i| sum.send input, i}
		elsif input.count == 2 and input[1].is_a? Symbol
			reduce(input[0]) {|sum,i| sum.send input[1], i}
		else
			sum = input[0]
			each { |i| sum = sum.nil? ? i : yield(sum, i) }
			sum
		end
	end
end