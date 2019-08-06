require 'csv'
# program: email_parser.rb
# usage:   ruby email_parser.rb input_filename > output_filename

# checks number of command line arguments
unless ARGV.length == 1
  puts "Exécution impossible sans argments"
  puts "usage : ruby email_parser.rb input_filename > output_filename\n"
  exit
end

# get the input filename from the command line
input_csv = ARGV[0]

# loop through each record in the csv file
CSV.foreach(input_csv) do |row1|
	#check email validity thru regexp
	valid_email = row1[0].scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i)
	
	valid_email.each do |ve| 
		full_name = ve.split('@')[0]
		first_name = full_name.split('.')[0]
		last_name = full_name.split('.')[1]
	 	puts " #{first_name} #{last_name} "
	end 	
end


