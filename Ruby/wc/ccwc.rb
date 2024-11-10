# frozen_string_literal: true

require_relative './file_utility'

include FileUtility

def find_input_command(input_array)
  return 'invalid' if input_array.nil?
  return '-c' if input_array.include?('-c')
  return '-l' if input_array.include?('-l')
  return '-w' if input_array.include?('-w')
  return '-m' if input_array.include?('-m')

  'invalid'
end

def print_info(count, file_name)
  puts "#{count} #{file_name}" unless file_name.nil?
  puts count if file_name.nil?
end

def find_index_of_file_and_command(input_array)
  input = find_input_command(input_array[0])
  return [input, 1] if input != 'invalid'

  input = find_input_command(input_array[1])
  [input, 0] if input != 'invalid'
end

def read(file)
  file_content = ''
  File.foreach(file) do |line|
    file_content += line
  end
  file_content
end

input = ''
# `ARGV` is a special global variable that holds the command-line arguments passed to a Ruby script.
input_array = ARGV
command_index = find_index_of_file_and_command(input_array)
if !$stdin.tty?
  # STDIN.tty? to check if the standard input is interactively coming from the terminal.
  # eg: `cat test.txt | ruby ccwb.rb -c`
  # in the above input - test.txt is not being directly used as the standard input to the ruby script,
  # rather the contents of the file are used an input.
  #
  # `$stdin` is a global variable that represents the standard input stream.
  # The use of $stdin in this context allows the script to read from the standard input,
  # which is being provided through the pipe (|) from the cat command.
  file_content = ''
  $stdin.each_line do |line|
    file_content += line
  end
  input = command_index[0]
elsif input_array.length > 1
  input = command_index[0]
  file_name = input_array[command_index[1]]
  file_content = read(file_name)
elsif input_array.length.positive?
  file_name = input_array[0]
  file_content = read(file_name)
else
  raise StandardError.new 'Please provide a file'
end

FileUtility::init file_content

case input
when '-c'
  print_info(FileUtility::size, file_name)
when '-l'
  print_info(FileUtility::lines_count, file_name)
when '-w'
  print_info(FileUtility::word_count, file_name)
when '-m'
  print_info(FileUtility::char_count, file_name)
else
  puts "#{FileUtility::lines_count} #{FileUtility::word_count} #{FileUtility::size} #{file_name}" unless file_name.nil?
  puts "#{FileUtility::lines_count} #{FileUtility::word_count} #{FileUtility::size}" if file_name.nil?
end
