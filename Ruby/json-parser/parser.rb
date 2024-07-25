# parsing the files for step1

require 'debug'

class Parser
  attr_accessor :file_name

  def initialize(file_name)
    @file_name = file_name
  end

  def parse
    file_content = File.read(file_name)
    binding.break
  end

  def is_valid?
    valid_json = parse
    return exit_with_message("Given JSON is valid", 0) if valid_json
    exit_with_message("Given JSON is not valid", 1)
  end

  private

  def exit_with_message(message, exit_code)
    puts message
    exit exit_code
  end


end
