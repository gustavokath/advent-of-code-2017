count = 0
$stdin.each_line do |line|
  hash = {}
  str_array = line.split(' ')
  error = false

  for i in (0..str_array.size-2) do
		base = {}
		for letter in str_array[i].split('') do
			unless base.key? letter
				base[letter] = 1
			else
				base[letter] += 1
			end
		end
		start = i+1
		for j in (start..str_array.size-1) do
			comp_hash = base.clone
			for letter in str_array[j].split('') do
				if comp_hash.key? letter
					comp_hash[letter] -= 1
				else
					comp_hash[letter] = -1
				end
			end

      error_letter = 0
			comp_hash.each do |key, letter_diff|
				error_letter += 1 if letter_diff == 0	
			end
      

			error = true if error_letter == comp_hash.length
		end
	end
 
  count += 1 unless error
end
p count



