require 'csv'
# program: email_parser.rb
# usage:   ruby email_parser.rb input_filename > output_filename

# get the input filename from the command line
input_csv = ARGV[0]

# loop through each record in the csv file
CSV.foreach(input_csv) do |row1|
	puts row1.inspect
end


