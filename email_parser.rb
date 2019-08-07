require 'csv'
# program: email_parser.rb
# usage:   ruby email_parser.rb input_filename > output_filename

SCOPE_ID = 16

# checks number of command line arguments
unless ARGV.length == 1
  puts "Exécution impossible sans arguments"
  puts "usage : ruby email_parser.rb input_filename > output_filename\n"
  exit
end

# get the input filename from the command line
input_csv = ARGV[0]

# store Collaborator entries
collab_array = [['first_name', 'last_name', 'email', 'scope_id']]

# loop through each record in the csv file
CSV.foreach(input_csv) do |row1|
	#check email validity thru regexp
	valid_email = row1[0].scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i)
	
	valid_email.each do |ve| 
		email = ve.to_s
		full_name = ve.split('@')[0]
		first_name = full_name.split('.')[0].capitalize
		last_name = full_name.split('.')[1].capitalize
		scope_id = SCOPE_ID
	 	# puts " #{first_name} #{last_name}  #{email}  #{scope_id}"
		collab_array.push([first_name, last_name, email, scope_id])  
	end 	
end

# write collaborator list to csv file
CSV.open('collab_list.csv', 'w') do |csv|
  collab_array.each do |row|
	  csv << row
	end 
end

