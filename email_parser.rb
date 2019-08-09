# program: email_parser.rb
# usage:   ruby email_parser.rb input_filename

require 'csv'
require './collaborator'

COMPANY_A = 'A_Company'
SCOPE_ID = 16

# get the input filename from the command line
input_csv = ARGV[0]

output_csv = "#{File.expand_path(File.dirname(__FILE__))}/collab_list_#{COMPANY_A}.csv"

def output_collab_list(input_csv)
  collab_array = [['first_name', 'last_name', 'email', 'scope_id']]

  CSV.foreach(input_csv) do |row1|
    #check email validity thru regexp
    valid_email = row1[0].scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i)
    
    # push collaborators in an array 
    valid_email.each do |ve| 
      email = ve.to_s
      full_name = ve.split('@')[0]
      first_name = full_name.split('.')[0].capitalize
      last_name = full_name.split('.')[1].capitalize
      scope_id = SCOPE_ID
      collab = Collaborator.new(first_name, last_name, scope_id, email)
      collab_array.push(collab.to_csv)  
    end   
  end
  collab_array
end

def write_output_csv(output_csv, ca)
  # write collaborator list to csv file
  CSV.open(output_csv, 'w') do |csv|
    ca.each do |row|
      csv << row
    end 
  end
end
  
  
if $0 == __FILE__
  # checks number of command line arguments
  unless ARGV.length == 1
    puts "Exécution impossible sans arguments"
    puts "usage : ruby email_parser.rb input_filename > output_filename\n"
    exit
  end

  # execute the scrpit
  write_output_csv(output_csv, output_collab_list(input_csv))
  puts "Collaborators file completed"
end
