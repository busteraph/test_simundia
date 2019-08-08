# Unit tests for email_parser.rb

require "test/unit"
require File.expand_path(File.dirname(__FILE__)) + "/../email_parser.rb"

class TC_EmailParser < Test::Unit::TestCase
      
  # test that the method return an array
  def test_output_collab_list
    input_file = 'collab_list.csv'
    assert_kind_of(Array, output_collab_list(input_file))  
  end

  # test that the writing of oput csv file
  def test_write_csv_output
    input_file = 'collab_list.csv'
    output_array = output_collab_list(input_file)
    write_csv_output(output_array)
    assert_path_exist(File.expand_path(File.dirname(__FILE__)) + "/../collab_list.csv")  
  end

end
