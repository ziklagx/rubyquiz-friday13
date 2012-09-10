class FridayFinder

	def find_fridays_the_13th start_date, end_date
		fridays_the_13th = []
		
		date = start_date

		while date < end_date do
			next_friday = skip_month date, end_date

			if(next_friday.nil?)
				break;
			end
			
			fridays_the_13th.push next_friday
			date = next_friday+1

		end

		fridays_the_13th

	end

	#brute strength approach - slow - takes 1.1 seconds to run tests (4000 years or so)
	def by_day start_date, end_date
		date = start_date

		while date != end_date do 
			if(date.day == 13 && date.friday?)
				return date
			end

			date = date.next
		end

	end

	#skipping to 13 of each month - takes 0.06 seconds to run tests (4000 years or so)
	def skip_month start_date, end_date
		date = start_date

		if(date.day < 13)
			date = Date.new date.year, date.month, 13
		elsif(date.day > 13)
			date = date >> 1
			date = Date.new date.year, date.month , 13
		end


		while date <= end_date do 
			if(date.friday?)
				return date
			end

			date = date >> 1
		end
	end

	#any month which starts on a Sunday will have a Friday the 13th - takes 0.09 seconds to run tests (4000 years or so)
	def check_first_day_of_month start_date, end_date

		if(start_date.day > 13)
			start_date = start_date >> 1
		end

		while start_date <= end_date do 
			check_date = Date.new(start_date.year, start_date.month, 1)

			if(check_date.sunday?)
				return Date.new(start_date.year, start_date.month, 13)
			end

			start_date = start_date >> 1
		end


	end



end