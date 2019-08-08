# Unit tests for email_parser.rb

require "test/unit"
require "#{File.expand_path(File.dirname(__FILE__))}/../email_parser.rb"

class TC_EmailParser < Test::Unit::TestCase

  def test_output_collab_list
    expected_result = [["first_name", "last_name", "email", "scope_id"], 
                      ["Alain", "Dieckhoff", 16, "alain.dieckhoff@entreprisea.fr"], 
                      ["Alexandre", "Desrumaux", 16, "alexandre.desrumaux@entreprisea.fr"], 
                      ["Alice", "Antheaume", 16, "alice.antheaume@entreprisea.fr"]]

    assert_equal(expected_result, output_collab_list(input_csv_file))
  end

  def test_write_output_csv
    collab_array = output_collab_list(input_csv_file)
    assert_kind_of(Array, collab_array)  
    write_output_csv(output_csv_file, collab_array)
    assert_path_exist("#{File.expand_path(File.dirname(__FILE__))}/support/collab_list.csv")  
  end

  def input_csv_file
    "#{File.expand_path(File.dirname(__FILE__))}/support/company_emails.csv"
  end
      
  def output_csv_file
    "#{File.expand_path(File.dirname(__FILE__))}/support/collab_list.csv"
  end
      
end
