def input_command_valid?(input_array)
  input_array.include?('-c') ||
    input_array.include?('-l') ||
    input_array.include?('-w') ||
    input_array.include?('-m')
end

def file_size(file_content)
  file_content.bytesize
end

def lines_count(lines)
  lines.count
end

def word_count(file_content)
  file_content.split(/\s+/).length
end

def char_count(file_content)
  file_content.length
end

def print_info(count, file_name)
  puts "#{count} #{file_name}" unless file_name.empty?
  puts "#{count}" if file_name.empty?
end

file_content = ''
file_name = ''
# `ARGV` is a special global variable that holds the command-line arguments passed to a Ruby script.
input_array = ARGV
if input_command_valid?(input_array) && !STDIN.tty?
  # STDIN.tty? check if the standard input is interactively coming from the terminal.
  # eg: `cat test.txt | ruby ccwb.rb -c` here the input - text.txt is not being directly used as the standard input, rather the contents of the file are used an input.
  # `$stdin` is a global variable that represents the standard input stream.
  # The use of $stdin in this context allows the script to read from the standard input, which is being provided through the pipe (|) from the cat command.
  file_content = $stdin.read
elsif input_array.length > 1 
  file_name = input_array[1]
  file_content = File.read(file_name)
elsif input_array.length > 0
  file_name = input_array[0]
  file_content = File.read(file_name)
end

lines = file_content.lines

if input_array.include?('-c')
  print_info(file_size(file_content), file_name)
elsif input_array.include?('-l')
  print_info(lines_count(lines), file_name)
elsif input_array.include?('-w')
  print_info(word_count(file_content), file_name)
elsif input_array.include?('-m')
  print_info(char_count(file_content), file_name)
else 
  puts "#{lines_count(lines)} #{word_count(file_content)} #{file_size(file_content)} #{file_name}" unless file_name.empty?
  puts "#{lines_count(lines)} #{word_count(file_content)} #{file_size(file_content)}" if file_name.empty?
end
