require './friday_finder'
require 'date'

describe 'friday_finder' do 

	it "should find the friday the 13ths for 2013" do
		start_date = Date.new 2013,1,1
		end_date = Date.new 2013,12,31

		FridayFinder.new.find_fridays_the_13th(start_date, end_date).size.should eql 2
	end

	it "should find the friday the 13ths for 2013-2014" do
		start_date = Date.new 2013,1,1
		end_date = Date.new 2014,12,31

		FridayFinder.new.find_fridays_the_13th(start_date, end_date).size.should eql 3
	end

	it "should find the friday the 13ths for a long period (2013-6000)" do
		start_date = Date.new 2013,1,1
		end_date = Date.new 6000,12,31

		FridayFinder.new.find_fridays_the_13th(start_date, end_date).size.should eql 6859
	end
	
end