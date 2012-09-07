class FridayFinder

	def find_fridays_the_13th start_date, end_date
		fridays_the_13th = []
		
		date = start_date

		while date < end_date do

			next_friday = next_friday_13th date, end_date

			if(next_friday.nil?)
				break;
			end
			
			fridays_the_13th.push next_friday
			#puts "#{next_friday} is a Friday the 13th"

			date = next_friday+1

		end

		fridays_the_13th

	end

	#brute strength approach - slow - 4000years takes about a second
	def next_friday_13th start_date, end_date
		date = start_date

		while date != end_date do 
			if(date.day == 13 && date.friday?)
				return date
			end

			date = date.next
		end

	end





end